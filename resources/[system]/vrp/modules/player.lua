-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
local Global = {}
Objects = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("CharacterChosen", function(Passport, source)
    local Datatable = vRP.Datatable(Passport)
    local Identity = vRP.Identity(Passport)
    if Datatable and Identity then
        if Datatable["Pos"] then
            if not (Datatable["Pos"]["x"] and Datatable["Pos"]["y"] and Datatable["Pos"]["z"]) then
                Datatable["Pos"] = { x = SpawnCoords["x"], y = SpawnCoords["y"], z = SpawnCoords["z"] }
            end
        else
            Datatable["Pos"] = { x = SpawnCoords["x"], y = SpawnCoords["y"],  z = SpawnCoords["z"] }
        end

        if not Datatable["Skin"] then
            Datatable["Skin"] = "mp_m_freemode_01"
        end

        if not Datatable["Inventory"] then
            Datatable["Inventory"] = {}
        end

        if not Datatable["Health"] then
            Datatable["Health"] = 200
        end

        if not Datatable["Armour"] then
            Datatable["Armour"] = 0
        end

        if not Datatable["Stress"] then
            Datatable["Stress"] = 0
        end

        if not Datatable["Hunger"] then
            Datatable["Hunger"] = 100
        end

        if not Datatable["Thirst"] then
            Datatable["Thirst"] = 100
        end

        if not Datatable["Weight"] then
            Datatable["Weight"] = BackpackWeightDefault
        end

        vRPC.Skin(source,Datatable["Skin"])
        vRP.SetArmour(source,Datatable["Armour"])
        vRPC.SetHealth(source,Datatable["Health"])
        vRP.Teleport(source,Datatable["Pos"]["x"],Datatable["Pos"]["y"],Datatable["Pos"]["z"])

        TriggerClientEvent("barbershop:Apply",source,vRP.UserData(Passport,"Barbershop"))
        TriggerClientEvent("skinshop:Apply",source,vRP.UserData(Passport,"Clothings"))
        TriggerClientEvent("tattooshop:Apply",source,vRP.UserData(Passport,"Tatuagens"))

        TriggerClientEvent("hud:Thirst",source,Datatable["Thirst"])
        TriggerClientEvent("hud:Hunger",source,Datatable["Hunger"])
        TriggerClientEvent("hud:Stress",source,Datatable["Stress"])

        TriggerClientEvent("vRP:Active",source,Passport,Identity["name"].." "..Identity["name2"])
        
        if Global[Passport] then
            TriggerClientEvent("spawn:justSpawn",source,false,false)
        else
            TriggerClientEvent("spawn:justSpawn",source,true,vec3(Datatable["Pos"]["x"],Datatable["Pos"]["y"],Datatable["Pos"]["z"]))
        end

        TriggerEvent("Connect",Passport,source,Global[Passport] == nil)
        Global[Passport] = true
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JUSTOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:justObjects")
AddEventHandler("vRP:justObjects",function()
    local source = source
    local Passport = vRP.Passport(source)
    local Inventory = vRP.Inventory(Passport)
    if Passport then
        for i = 1, 5 do
            if Inventory[tostring(i)] and "Armamento" == itemType(Inventory[tostring(i)]["item"]) then
                TriggerClientEvent("inventory:CreateWeapon",source,Inventory[tostring(i)]["item"])
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BACKPACKWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BackpackWeight")
AddEventHandler("vRP:BackpackWeight",function(value)
    local source = source
    local Passport = vRP.Passport(source)
    local Datatable = vRP.Datatable(Passport)
    if Passport then
        if value then
            if not Global[Passport] then
                Datatable["Weight"] = Datatable["Weight"] + 50
                Global[Passport] = true
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEOBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("DeleteObject")
AddEventHandler("DeleteObject",function(index,value)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if value and Objects[Passport] and Objects[Passport][value] then
            index = Objects[Passport][value]
            Objects[Passport][value] = nil
        end
    end
    TriggerEvent("DeleteObjectServer",index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEOBJECTSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DeleteObjectServer",function(entIndex)
    local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId(entIndex)
    if DoesEntityExist(NetworkGetEntityFromNetworkId) and not IsPedAPlayer(NetworkGetEntityFromNetworkId) and 3 == GetEntityType(NetworkGetEntityFromNetworkId) then
        DeleteEntity(NetworkGetEntityFromNetworkId)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("DeletePed")
AddEventHandler("DeletePed",function(entIndex)
    local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId(entIndex)
    if DoesEntityExist(NetworkGetEntityFromNetworkId) and not IsPedAPlayer(NetworkGetEntityFromNetworkId) and 1 == GetEntityType(NetworkGetEntityFromNetworkId) then
        DeleteEntity(NetworkGetEntityFromNetworkId)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUGOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DebugObjects",function(value)
    if Objects[value] then
        for k,v in pairs(Objects[value]) do
            Objects[value][k] = nil
            TriggerEvent("DeleteObjectServer", k)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUGWEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("DebugWeapons",function(value)
    if Objects[value] then
        for k,v in pairs(Objects[value]) do
            TriggerEvent("DeleteObjectServer", v)
            Objects[value] = nil
        end
        Objects[value] = nil
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gg",function(source)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and SURVIVAL.CheckDeath(source) then
        vRP.ClearInventory(Passport)

        if not vRP.UserPremium(Passport) then
            local Datatable = vRP.Datatable(Passport)
            if WipeBackpackDeath and Datatable and Datatable["Weight"] then
                Datatable["Weight"] = BackpackWeightDefault
            end
        end
    
        vRP.UpgradeThirst(Passport,100)
        vRP.UpgradeHunger(Passport,100)
        vRP.DowngradeStress(Passport,100)
        TriggerEvent("Discord","Airport","**Source:** "..source..[[ **Passaporte:** ]]..Passport..[[ **Address:** ]]..GetPlayerEndpoint(source),3092790)
        SURVIVAL.Respawn(source)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARINVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ClearInventory(Passport)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if source and Datatable and Datatable["Inventory"] then
        exports["inventory"]:CleanWeapons(parseInt(Passport),true)

        TriggerEvent("DebugObjects",parseInt(Passport))
        TriggerEvent("DebugWeapons",parseInt(Passport))

        Datatable["Inventory"] = {}
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeThirst(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Thirst"] then
            Datatable["Thirst"] = 0
        end

        Datatable["Thirst"] = Datatable["Thirst"] + parseInt(Amount)
        if Datatable["Thirst"] > 100 then
            Datatable["Thirst"] = 100
        end

        TriggerClientEvent("hud:Thirst",source,Datatable["Thirst"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeHunger(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Hunger"] then
            Datatable["Hunger"] = 0
        end

        Datatable["Hunger"] = Datatable["Hunger"] + parseInt(Amount)
        if Datatable["Hunger"] > 100 then
            Datatable["Hunger"] = 100
        end

        TriggerClientEvent("hud:Hunger",source,Datatable["Hunger"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeStress(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Stress"] then
            Datatable["Stress"] = 0
        end

        Datatable["Stress"] = Datatable["Stress"] + parseInt(Amount)
        if Datatable["Stress"] > 100 then
            Datatable["Stress"] = 100
        end

        TriggerClientEvent("hud:Stress",source,Datatable["Stress"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADETHIRST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeThirst(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Thirst"] then
            Datatable["Thirst"] = 100
        end

        Datatable["Thirst"] = Datatable["Thirst"] - parseInt(Amount)
        if Datatable["Thirst"] < 0 then
            Datatable["Thirst"] = 0
        end

        TriggerClientEvent("hud:Thirst",source,Datatable["Thirst"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADEHUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeHunger(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Hunger"] then
            Datatable["Hunger"] = 100
        end

        Datatable["Hunger"] = Datatable["Hunger"] - parseInt(Amount)
        if Datatable["Hunger"] < 0 then
            Datatable["Hunger"] = 0
        end

        TriggerClientEvent("hud:Hunger",source,Datatable["Hunger"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DowngradeStress(Passport,Amount)
    local source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and source then
        if not Datatable["Stress"] then
            Datatable["Stress"] = 0
        end

        Datatable["Stress"] = Datatable["Stress"] - parseInt(Amount)
        if Datatable["Stress"] < 0 then
            Datatable["Stress"] = 0
        end

        TriggerClientEvent("hud:Stress",source,Datatable["Stress"])
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOODS
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.Foods()
    local source = source
    local Passport = vRP.Passport(source)
    local Datatable = vRP.Datatable(Passport)
    if source and Datatable then
        if not Datatable["Thirst"] then
            Datatable["Thirst"] = 100
        end

        if not Datatable["Hunger"] then
            Datatable["Hunger"] = 100
        end

        Datatable["Hunger"] = Datatable["Hunger"] - 1
        Datatable["Thirst"] = Datatable["Thirst"] - 1

        if Datatable["Thirst"] < 0 then
            Datatable["Thirst"] = 0
        end

        if Datatable["Hunger"] < 0 then
            Datatable["Hunger"] = 0
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHEALTH
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetHealth(source)
    local GetPlayerPed = GetPlayerPed(source)
    return GetEntityHealth(GetPlayerPed)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MODELPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ModelPlayer(source)
    local GetPlayerPed = GetPlayerPed(source)
    if GetEntityModel(GetPlayerPed) == GetHashKey("mp_f_freemode_01") then
        return "mp_f_freemode_01"
    elseif GetEntityModel(GetPlayerPed) == GetHashKey("mp_m_freemode_01") then
        return "mp_m_freemode_01"
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETEXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetExperience(Passport,Work)
    local Datatable = vRP.Datatable(Passport)
    if Datatable and not Datatable[Work] then
        Datatable[Work] = 0
    end
    return Datatable[Work] or 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PUTEXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PutExperience(Passport,Work,Number)
    local Datatable = vRP.Datatable(Passport)
    if Datatable then
        if not Datatable[Work] then
            Datatable[Work] = 0
        end
        Datatable[Work] = Datatable[Work] + Number
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMOUR
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetArmour(source,Amount)
    local GetPlayerPed = GetPlayerPed(source)
    if GetPedArmour(GetPlayerPed) + Amount > 100 then
        Amount = 100 - GetPedArmour(GetPlayerPed)
    end
    SetPedArmour(GetPlayerPed,GetPedArmour(GetPlayerPed) + Amount)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Teleport(source,x,y,z)
    local GetPlayerPed = GetPlayerPed(source)
    SetEntityCoords(GetPlayerPed, x + 1.0E-4, y + 1.0E-4, z + 1.0E-4, false, false, false, false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETENTITYCOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetEntityCoords(source)
    local GetPlayerPed = GetPlayerPed(source)
    return GetEntityCoords(GetPlayerPed)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSIDEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InsideVehicle(source)
    local GetPlayerPed = GetPlayerPed(source)
    if 0 == GetVehiclePedIsIn(GetPlayerPed) or true then
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPED
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.CreatePed(Model,x,y,z,heading,typ)
    local SpawnPed = 0
    local Hash = GetHashKey(Model)
    local Ped = CreatePed(typ,Hash,x,y,z,heading,true,false)
    while true do
        if not DoesEntityExist(Ped) and SpawnPed <= 1000 then
            SpawnPed = SpawnPed + 1
            Wait(1)
        end
    end
    if DoesEntityExist(Ped) then
        return true,NetworkGetNetworkIdFromEntity(Ped)
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEOBJECT
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.CreateObject(Model,x,y,z,Weapon)
    local Passport = vRP.Passport(source)
    if Passport then
        local spawnObjects = 0
        local hash = GetHashKey(Model)
        local object = CreateObject(hash,x,y,z,true,true,false)

        while not DoesEntityExist(object) and spawnObjects <= 1000 do
            spawnObjects = spawnObjects + 1
            Wait(1)
        end
        local network = NetworkGetNetworkIdFromEntity(object)
        if DoesEntityExist(object) then
            if Weapon then
                if not Objects[Passport] then
                    Objects[Passport] = {}
                end
                Objects[Passport][Weapon] = network
            else
                if not Objects[Passport] then
                    Objects[Passport] = {}
                end
                Objects[Passport][network] = true
            end
            return true,network
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        for k,v in pairs(Sources) do
            vRP.DowngradeHunger(k,ConsumeHunger)
            vRP.DowngradeThirst(k,ConsumeThirst)
        end
        Wait(CooldownHungerThrist)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUCKETCLIENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BucketClient")
AddEventHandler("vRP:BucketClient",function(value)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if value == "Enter" then
            Player(source)["state"]["Route"] = Passport
            SetPlayerRoutingBucket(source, Passport)
        else
            Player(source)["state"]["Route"] = 0
            SetPlayerRoutingBucket(source,0)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUCKETSERVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vRP:BucketServer")
AddEventHandler("vRP:BucketServer",function(source,value,bucket)
    if value == "Enter" then
        Player(source)["state"]["Route"] = bucket
        SetPlayerRoutingBucket(source,bucket)
        if bucket > 0 then
            SetRoutingBucketEntityLockdownMode(bucket,"inactive")
            SetRoutingBucketPopulationEnabled(bucket,false)
        end
    else
        Player(source)["state"]["Route"] = 0
        SetPlayerRoutingBucket(source,0)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
    TriggerEvent("DebugObjects",Passport)
    TriggerEvent("DebugWeapons",Passport)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)