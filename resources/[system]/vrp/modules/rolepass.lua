-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEROLEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpdateRolepass(source,Day)
    print(source, Day)
    if Characters[source] then
        vRP.Query("accounts/Rolepass",{ license = Characters[source]["license"], rolepass = Day })
        Characters[source]["rolepass"] = Day
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROLEPASS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.CheckRolepass(source)
    if Characters[source] and Characters[source]["rolepass"] > 0 then
        return true
    end
    return false
end