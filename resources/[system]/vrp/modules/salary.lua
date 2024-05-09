-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Salary = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETHIERARQUIA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetHierarquia(Passport,Permission)
    local Datatable = vRP.GetSrvData("Permissions:"..Permission)
    for k, v in pairs(Datatable) do
        return k,v
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY:ADD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Salary:Add",function(Passport,Permission)
    if not Salary[Permission] then
        Salary[Permission] = {}
    end
    if not Salary[Permission][Passport] then
        Salary[Permission][Passport] = os.time() + SalarySeconds
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SALARY:REMOVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Salary:Remove",function(Passport,Permission)
    if Permission then
        if Salary[Permission] and Salary[Permission][Passport] then
            Salary[Permission][Passport] = nil
        end
    else
        for k, v in pairs(Salary) do
            if Salary[k][Passport] then
                Salary[k][Passport] = nil
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(SalarySeconds * 1000)
        for k, v in pairs(Salary) do
            for Passport, Sources in pairs(Salary[k]) do
                local id,level = vRP.GetHierarquia(Passport,k)
                Salary[k][Passport] = os.time() + SalarySeconds
                if vRP.HasGroup(Passport, k,level) then
                    if Groups[k] and Groups[k]["Salary"][level]  and vRP.HasService(Passport,k) then
                        vRP.GiveBank(Passport,Groups[k]["Salary"][level])
                    end
                else
                    Salary[k][Passport] = nil
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
    for k,v in pairs(Salary) do
        if Salary[k][Passport] then
            Salary[k][Passport] = nil
        end
    end
end)