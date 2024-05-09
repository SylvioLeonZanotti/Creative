-----------------------------------------------------------------------------------------------------------------------------------------
-- ONCLIENTRESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("onClientResourceStart")
AddEventHandler("onClientResourceStart",function(Resource)
	if (GetCurrentResourceName() ~= Resource) then
		return
	end

	DoScreenFadeOut(0)
	DisplayRadar(false)
	ShutdownLoadingScreen()
	TriggerEvent("spawn:Opened")
end)