-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetMedicPlan(Passport)
	local Source = vRP.Source(Passport)
	
	vRP.Query("accounts/SetMedicPlan",{ steam = Characters[Source]["steam"], medicplan = os.time() + 2592000 })

	if Characters[Source] then
		Characters[Source]["medicplan"] = parseInt(os.time() + 2592000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADEMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpgradeMedicPlan(Passport)
	local Source = vRP.Source(Passport)
	
	vRP.Query("accounts/updateMedicPlan",{ steam = Characters[Source]["steam"] })

	if Characters[Source] then
		Characters[Source]["medicplan"] = Characters[Source]["medicplan"] + 2592000
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USERMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UserMedicPlan(Passport)
	local Source = vRP.Source(Passport)

	if Characters[Source] then
		if Characters[Source]["medicplan"] >= os.time() then
			return true
		end
	else
		local Identity = vRP.Query("characters/Person",{ id = Passport })
		if Identity[1] then
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LICENSEMEDICPLAN
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.LicenseMedicPlan(steam)
	local Info = vRP.Account(steam)
	if Info and Info["medicplan"] >= os.time() then
		return true
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)