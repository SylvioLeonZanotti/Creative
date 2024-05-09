-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Sources = {}
Characters = {}
GlobalState["Players"] = {}
local Players = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUERIES
-----------------------------------------------------------------------------------------------------------------------------------------
local Prepares = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Prepare(Name,Query)
    Prepares[Name] = Query
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUERY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Query(Name,Params)
    return exports["oxmysql"]:query_async(Prepares[Name],Params)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTITIES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Identities(source)
    local Result = false

    local Identifiers = GetPlayerIdentifiers(source)
    for _, v in pairs(Identifiers) do
        if string.find(v,BaseMode) then
            local SplitName = splitString(v, ":")
            Result = SplitName[2]
            break
        end
    end

    return Result
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARCHIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Archive(Archive,Text)
    Archive = io.open(Archive,"a")
    if Archive then
        Archive.write(Archive,Text.."\n")
    end
    Archive.close(Archive)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANNED
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Banned(License)
    local Consult = vRP.Query("banneds/GetBanned",{ license = License })
    if Consult and Consult[1] then
        if Consult[1].time <= os.time() then
            vRP.Query("banneds/RemoveBanned",{ license = License })
            return false
        end
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACCOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Account(License)
    return vRP.Query("accounts/Account",{ license = License })[1] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERDATA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserData(Passport,Key)
    local Consult = vRP.Query("playerdata/GetData",{ Passport = Passport, dkey = Key })
    if Consult and Consult[1] then
        return json.decode(Consult[1]["dvalue"])
    else
        return {}
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSIDEPROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InsidePropertys(Passport,Coords)
    local Datatable = vRP.Datatable(Passport)
    if Datatable then
        Datatable["Pos"] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]) }
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Inventory(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable then
        if not Datatable["Inventory"] then
            Datatable["Inventory"] = {}
        end
        return Datatable["Inventory"]
    end
    return {}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINCHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SkinCharacter(Passport,Hash)
    local Datatable = vRP.Datatable(Passport)
    if Datatable then
        Datatable["Skin"] = Hash
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSPORT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Passport(source)
    if Characters[source] then
        return Characters[source]["id"]
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Players()
    return Sources
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Source(Passport)
    return Sources[parseInt(Passport)]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATATABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Datatable(Passport)
    if Characters[Sources[parseInt(Passport)]] then
        return Characters[Sources[parseInt(Passport)]]["table"]
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Kick(source,Reason)
    DropPlayer(source,Reason)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDROPPED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDropped", function(Reason)
    local Ped = GetPlayerPed(source)
    local Health = GetEntityHealth(Ped)
    local Armour = GetPedArmour(Ped)
    local Coords = GetEntityCoords(Ped)
    if Characters[source] and DoesEntityExist(Ped) then
        Disconnect(source,Health,Armour,Coords,Reason)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
function Disconnect(source,Health,Armour,Coords,Reason)
    local source = source
    local Passport = vRP.Passport(source)
    local Datatable = vRP.Datatable(Passport)
    if Passport then
        TriggerEvent("Discord","Disconnect","**Source:** "..source.."\n**Passaporte:** "..Passport.."\n**Health:** "..Health.."\n**Armour:** "..Armour.."\n**Cds:** "..Coords.."\n**Motivo:** "..Reason,3092790)

        if Datatable then
            Datatable["Health"] = Health
            Datatable["Armour"] = Armour
            Datatable["Pos"] = { x = mathLength(Coords["x"]),y = mathLength(Coords["y"]),z = mathLength(Coords["z"]) }

            TriggerEvent("Disconnect",Passport,source)
            vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Datatable", dvalue = json.encode(Datatable) })
            Characters[source] = nil
            Sources[Passport] = nil

            if GlobalState["Players"][source] then
                GlobalState["Players"][source] = nil
                GlobalState:set("Players",GlobalState["Players"],true)
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("SaveServer",function()
    for k,v in pairs(Sources) do
        local Datatable = vRP.Datatable(k)
        if Datatable then
            vRP.Query("playerdata/SetData",{ Passport = k, dkey = "Datatable", dvalue = json.encode(Datatable) })
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTING
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Queue:Connecting",function(source,identifiers,deferrals)
    deferrals.defer()
    local Identity = vRP.Identities(source)
    if Identity then
        local Account = vRP.Account(Identity)
        if not Account then
            vRP.Query("accounts/newAccount",{ license = Identity })
        end
        if Maintenance then
            if MaintenanceLicenses[Identity] then
                deferrals.done()
            else
                deferrals.done(MaintenanceText)
            end
        elseif not vRP.Banned(Identity) then
            if Whitelisted then
                local Account = vRP.Account(Identity)
                if Account["whitelist"] then
                    deferrals.done()
                else
                    deferrals.done(ReleaseText..": "..Account["id"])
                end
            else
                deferrals.done()
            end
        else
            deferrals.done(BannedText..".")
        end
    else
        deferrals.done("Conexão perdida.")
    end
    TriggerEvent("Queue:Remove",identifiers)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.CharacterChosen(source,Passport,Model)
    Sources[Passport] = source
    if not Characters[source] then
        local Query = vRP.Query("characters/Person",{ id = Passport })
        local Identity = vRP.Identities(source)
        local Account = vRP.Account(Identity)
        if #Query > 0 then
            Characters[source] = {}
            Characters[source]["bank"] = Query[1]["bank"]
            Characters[source]["id"] = Query[1]["id"]
            Characters[source]["sex"] = Query[1]["sex"]
            Characters[source]["blood"] = Query[1]["blood"]
            Characters[source]["prison"] = Query[1]["prison"]
            Characters[source]["fines"] = Query[1]["fines"]
            Characters[source]["phone"] = Query[1]["phone"]
            Characters[source]["name"] = Query[1]["name"]
            Characters[source]["name2"] = Query[1]["name2"]
            Characters[source]["license"] = Query[1]["license"]
            Characters[source]["gems"] = Account["gems"]
            Characters[source]["rolepass"] = Account["rolepass"]
            Characters[source]["premium"] = Account["premium"]
            Characters[source]["discord"] = Account["discord"]
            Characters[source]["chars"] = Account["chars"]
            Characters[source]["table"] = vRP.UserData(Passport, "Datatable")

            Players[source] = Passport
            GlobalState["Players"] = Players

            GlobalState:set("Players",GlobalState["Players"],true)
        end
        if Model then
            Characters[source]["table"]["Skin"] = Model
            Characters[source]["table"]["Inventory"] = {}
            for k,v in pairs(CharacterItens) do
                vRP.GenerateItem(Passport,k,v,false)
            end
            if NewItemIdentity then
                vRP.GenerateItem(Passport,"identity-"..Passport,1,false)
            end
            vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Barbershop",dvalue = json.encode({ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 })})
            vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Clothings",dvalue = json.encode(StartClothes[Model])})
            vRP.Query("playerdata/SetData",{ Passport = Passport, dkey = "Datatable",dvalue = json.encode(Characters[source]["table"]),})
        end

        if 0 < Account["gems"] then
            TriggerClientEvent("hud:AddGems",source,Account["gems"])
        end
        
        TriggerEvent("Discord","Connect","**Source:**"..source..[[**Passaporte:**]]..Passport..[[**Ip:**]]..GetPlayerEndpoint(source),3092790)
        PerformHttpRequest(Discords["Login"],function(source,Passport,Model)end,"POST",json.encode({ username = ServerName,content = Account["discord"].." "..Passport.." "..Query[1]["name"].." "..Query[1]["name2"]}),{["Content-Type"] = "application/json" })
    end
    TriggerEvent("CharacterChosen",Passport,source)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    SetMapName(ServerName)
    SetGameType(ServerName)
    SetRoutingBucketEntityLockdownMode(0,"inactive")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REWARDS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:Rewards",function(source)
    if Characters[source] and Characters[source]["rolepass"] > 0 and parseInt(os.date("%d")) > Characters[source]["rolepass"] and Rewards[parseInt(os.date("%d"))] then
        vRP.GenerateItem(Characters[source]["id"], Rewards[parseInt(os.date("%d"))]["item"],Rewards[parseInt(os.date("%d"))]["amount"],false)
        TriggerClientEvent("inventory:Update",source,"Backpack")
        if parseInt((os.date("%d"))) >= 30 then
            vRP.UpdateRolepass(source,0)
        else
            vRP.UpdateRolepass(source,(parseInt((os.date("%d")))))
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:ActivePass",function(source)
    if Characters[source] then
        for i = 1, parseInt((os.date("%d"))) do
            if Rewards[parseInt((os.date("%d")))] then
                vRP.GenerateItem(Characters[source]["id"],Rewards[i]["item"],Rewards[i]["amount"],false)
                TriggerClientEvent("inventory:Update",source,"Backpack")
            end
        end
        if parseInt((os.date("%d"))) >= 30 then
            vRP.UpdateRolepass(source,0)
        else
            vRP.UpdateRolepass(source,(parseInt((os.date("%d")))))
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)