-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Groups()
    return Groups
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DATAGROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DataGroups(Permission)
    return vRP.GetSrvData("Permissions:"..Permission)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetUserType(Passport,Type)
    for k,v in pairs(Groups) do
        local Datatable = vRP.GetSrvData("Permissions:"..k)
        if Groups[k]["Type"] and Groups[k]["Type"] == Type and Datatable[tostring(Passport)] then
            return k
        end
    end
    return
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HIERARCHY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.Hierarchy(Permission)
    if Groups[Permission] and Groups[Permission]["Hierarchy"] then
        return Groups[Permission]["Hierarchy"]
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.NumPermission(Permission)
    local Services = {}
    local Amount = 0

    for i,v in pairs(vRP.Players()) do
        local Passport = vRP.Passport(v)

        if vRP.HasGroup(Passport,Permission) then
            Amount = Amount + 1
            Services[Passport] = v
        end
    end

    return Services,Amount

end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICETOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceToggle(Source,Passport,Permission,Silenced)
    local Perm = splitString(Permission,"-")
    if (Characters[Source] and Groups[Perm[1]]) and Groups[Perm[1]]["Service"] then
        if Groups[Perm[1]]["Service"][tostring(Passport)] == Source then
            vRP.ServiceLeave(Source,tostring(Passport),Perm[1],Silenced)
        else
            if vRP.HasGroup(tostring(Passport),Perm[1]) and not Groups[Perm[1]]["Service"][tostring(Passport)] then
                vRP.ServiceEnter(Source,tostring(Passport),Perm[1],Silenced)
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICEENTER
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceEnter(Source,Passport,Permission,Silenced)
    if Characters[Source] then
        if ClientState[Permission] then
            Player(Source)["state"][Permission] = true
            TriggerClientEvent("service:Label",Source,Permission,"Sair de Serviço")
        end
        if GroupBlips[Permission] then
            TriggerEvent("blipsystem:Enter",Source,Permission,true)
        end
        if Groups[Permission] and Groups[Permission]["Salary"] then
            TriggerEvent("Salary:Add", tostring(Passport),Permission)
        end
        Groups[Permission]["Service"][tostring(Passport)] = Source
        if not Silenced then
            TriggerClientEvent("Notify",Source,"verde","Entrou em serviço.", 5000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICELEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ServiceLeave(Source,Passport,Permission,Silenced)
    if Characters[Source] then
        if ClientState[Permission] then
            Player(Source)["state"][Permission] = false
            TriggerClientEvent("service:Label",Source,Permission,"Entrar em Serviço")
        end
        if GroupBlips[Permission] then
            TriggerEvent("blipsystem:Exit",Source)
            TriggerClientEvent("radio:RadioClean",Source)
        end
        if Groups[Permission] and Groups[Permission]["Salary"] then
            TriggerEvent("Salary:Remove",tostring(Passport),Permission)
        end
        if Groups[Permission]["Service"] and Groups[Permission]["Service"][tostring(Passport)] then
            Groups[Permission]["Service"][tostring(Passport)] = nil
        end
        if not Silenced then
            TriggerClientEvent("Notify",Source,"verde","Saiu de serviço.",5000)
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetPermission(Passport,Permission,Level,Mode)
    local Datatable = vRP.GetSrvData("Permissions:"..Permission)
    if Groups[Permission] then
        if Mode then
            if "Demote" == Mode then
                Datatable[tostring(Passport)] = Datatable[tostring(Passport)] + 1
                
                if Datatable[tostring(Passport)] > #Groups[Permission]["Hierarchy"] then
                    Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
                end
            else
                Datatable[tostring(Passport)] = Datatable[tostring(Passport)] - 1
                
                if Datatable[tostring(Passport)] > #Groups[Permission]["Hierarchy"] then
                    Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
                end
            end
        else
            if Level then
                Level = parseInt(Level)
                if #Groups[Permission]["Hierarchy"] < Level then 
                    Level = #Groups[Permission]["Hierarchy"]
                    Datatable[tostring(Passport)] = Level
                else
                    Datatable[tostring(Passport)] = Level
                end
            end
            if not Level then
                Datatable[tostring(Passport)] = #Groups[Permission]["Hierarchy"]
            end
        end
        vRP.ServiceEnter(vRP.Source(Passport),tostring(Passport),Permission,true)
        vRP.Query("entitydata/SetData",{ dkey = "Permissions:"..Permission,dvalue = json.encode(Datatable) })
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemovePermission(Passport,Permission)
    local Datatable = vRP.GetSrvData("Permissions:"..Permission)
    if Groups[Permission] then
        if Groups[Permission]["Service"] and Groups[Permission]["Service"][tostring(Passport)] then
            Groups[Permission]["Service"][tostring(Passport)] = nil
        end
        if Datatable[tostring(Passport)] then
            Datatable[tostring(Passport)] = nil
            vRP.ServiceLeave(vRP.Source(tostring(Passport)),tostring(Passport),Permission,true)
            vRP.Query("entitydata/SetData",{ dkey = "Permissions:"..Permission,dvalue = json.encode(Datatable) })
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasPermission(Passport,Permission,Level)
    local Datatable = vRP.GetSrvData("Permissions:"..Permission)
    if Datatable[tostring(Passport)] then
        if not Level or not (Datatable[tostring(Passport)] > Level) then
            return true
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasGroup(Passport,Permission,Level)
    if Groups[Permission] then
        for k, v in pairs(Groups[Permission].Parent) do
            local Datatable = vRP.GetSrvData("Permissions:"..k)
            if Datatable[tostring(Passport)] then
                if not Level or not (Datatable[tostring(Passport)] > Level) then
                    return true
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.HasService(Passport,Permission)
    if Groups[Permission] then
        for k, v in pairs(Groups[Permission].Parent) do
            if Groups[k]["Service"][tostring(Passport)] then
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport, Source)
    for k,v in pairs(Groups) do
        if vRP.HasPermission(tostring(Passport), k) then
            vRP.ServiceEnter(Source,tostring(Passport),k,true)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport,Source)
    for k, v in pairs(Groups) do
        if Groups[k]["Service"][tostring(Passport)] then
            if GroupBlips[k] then
                TriggerEvent("blipsystem:Exit",Source)
            end
            Groups[k]["Service"][tostring(Passport)] = false
        end
        if Groups[k] and Groups[k]["Salary"] then
            TriggerEvent("Salary:Remove",tostring(Passport),k)
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