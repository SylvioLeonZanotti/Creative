-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Groups = {}
Groups["Room"] = {}
Groups["Users"] = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.create(source,Passport,Message)
    if Message and not Groups["Users"][Passport] and not Groups["Room"][Message] then
        Groups["Room"][Message] = {}
        Groups["Users"][Passport] = Message
        Groups["Room"][Message][Passport] = source        
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.add(source,Passport,Message)
    if not Groups["Users"][Passport] and not Groups["Room"][Message][Passport] then
        Groups["Users"][Passport] = Message
        Groups["Room"][Groups["Users"][Passport]][Passport] = source       
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.rem(source,Passport,Message)
    if Groups["Users"][Passport] and Groups["Room"][Message][Passport] then
        Groups["Users"][Passport] = nil
        Groups["Room"][Message][Passport] = nil        
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.leave(source,Passport)
    if Groups["Users"][Passport] then
        vRP.rem(source,Passport,Groups["Users"][Passport])       
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARTY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.party(Passport)
    if Passport then
        if Groups["Users"][Passport] and Groups["Room"][Groups["Users"][Passport]] then
            for k, v in pairs(Groups["Room"][Groups["Users"][Passport]]) do
                return " ".."#"..k.." "..vRP.Identity(k)["name"].." "..vRP.Identity(k)["name2"].."<br>"
            end
        end
        return false
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
    if Groups["Users"][Passport] then
        if Groups["Room"][Groups["Users"][Passport]] and Groups["Room"][Groups["Users"][Passport]][Passport] then
            Groups["Room"][Groups["Users"][Passport]][Passport] = nil
            if #Groups["Room"][Groups["Users"][Passport]] <= 0 then
                Groups["Room"][Groups["Users"][Passport]] = nil
            end
        end
        Groups["Users"][Passport] = nil
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARTY
-----------------------------------------------------------------------------------------------------------------------------------------
exports("Party",function(Passport,source,Distance)
    local Partys = {}
    if Groups["Users"][Passport] and Groups["Room"][Groups["Users"][Passport]] then
        for k,v in pairs(Groups["Room"][Groups["Users"][Passport]]) do
            if Distance >= #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(GetPlayerPed(v))) then
                Partys[#Partys + 1] = {
                    ["Passport"] = k,
                    ["source"] = source
                }
            end
        end
    end
    return Partys
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)