-----------------------------------------------------------------------------------------------------------------------------------------
-- FALSEIDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.FalseIdentity(Passport)
    return vRP.Query("fidentity/Result",{ id = Passport })[1] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Identity(Passport)
    local Source = vRP.Source(Passport)
    if Characters[Source] then
        return Characters[Source] or false
    else
        return vRP.Query("characters/Person",{ id = Passport })[1] or false
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INITPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InitPrison(Passport,Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/setPrison",{ Passport = Passport, prison = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source]["prison"] = parseInt(Amount)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPRISON
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpdatePrison(Passport,Amount)
    local Source = vRP.Source(Passport)
    if parseInt(Amount) > 0 then
        vRP.Query("characters/removePrison",{ Passport = Passport, prison = parseInt(Amount) })
        if Characters[Source] then
            Characters[Source]["prison"] = Characters[Source]["prison"] - parseInt(Amount)
            if 0 >= Characters[Source]["prison"] then
                Characters[Source]["prison"] = 0
                vRP.Teleport(Source,BackPrison["x"],BackPrison["y"],BackPrison["z"])
                TriggerClientEvent("Notify",Source,"verde","Serviços finalizados.",5000)
            else
                TriggerClientEvent("Notify", Source,"azul","Restam <b>"..Characters[Source]["prison"].." serviços</b>.",5000)
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADECHARS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeChars(source)
    if Characters[source] then
        vRP.Query("accounts/infosUpdatechars",{ license = Characters[source]["license"] })
        Characters[source]["chars"] = Characters[source]["chars"] + 1
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserGemstone(License)
    return vRP.Account(License)["gems"] or 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEGEMSTONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeGemstone(Passport,Amount)
    local Source = vRP.Source(Passport)
    local License = vRP.Identity(Passport)
    if parseInt(Amount) > 0 and License then
        vRP.Query("accounts/AddGems",{ license = License["license"], gems = parseInt(Amount) })
        if Characters[Source] then
            TriggerClientEvent("hud:AddGems", Source, (parseInt(Amount)))
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADENAMES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeNames(Passport,Name,Name2)
    local Source = vRP.Source(Passport)
    vRP.Query("characters/updateName",{ Passport = Passport, name = Name, name2 = Name2 })
    if Characters[Source] then
        Characters[Source]["name2"] = Name2
        Characters[Source]["name"] = Name
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradePhone(Passport,Phone)
    local Source = vRP.Source(Passport)
    vRP.Query("characters/updatePhone",{ id = Passport, phone = Phone })
    if Characters[Source] then
        Characters[Source]["phone"] = Phone
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PASSPORTPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PassportPlate(Plate)
    return vRP.Query("vehicles/plateVehicles",{ plate = Plate })[1] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserPhone(Phone)
    return vRP.Query("characters/getPhone",{ phone = Phone })[1] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATESTRING
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GenerateString(Format)
    local Number = ""
    for i = 1, #Format do
        if string.sub(Format, i,i) == "D" then
            Number = Number..string.char(string.byte("0") + math.random(0,9))
        elseif "L" == string.sub(Format,i,i) then
            Number = Number..string.char(string.byte("A") + math.random(0,25))
        else
            Number = Number..string.sub(Format,i,i)
        end
    end
    return Number
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEPLATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GeneratePlate()
    local Passport = nil
    local Serial = ""
    repeat
        Passport = vRP.PassportPlate((vRP.GenerateString("DDLLLDDD")))
        Serial = vRP.GenerateString("DDLLLDDD")
    until not Passport
    return Serial
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEPHONE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GeneratePhone()
    local Passport = nil
    local Phone = ""
    repeat
        Passport = vRP.UserPhone((vRP.GenerateString("DDD-DDD")))
        Phone = vRP.GenerateString("DDD-DDD")
    until not Passport
    return Phone
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)