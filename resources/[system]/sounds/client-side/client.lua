RegisterNetEvent("sounds:source")
AddEventHandler("sounds:source",function(sound,volume)
	SendNUIMessage({ transactionType = "playSound", transactionFile = sound, transactionVolume = volume })
end)

RegisterNetEvent("sounds:source:timeout")
AddEventHandler("sounds:source:timeout",function(sound,volume,timeout)
	SendNUIMessage({ transactionType = "playSound", transactionFile = sound, transactionVolume = volume, timeout = timeout })
end)

RegisterNetEvent("sounds:distance")
AddEventHandler("sounds:distance",function(sCoords,maxDistance,sound,volume)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local distance = #(coords - sCoords)

	if distance <= maxDistance then
		SendNUIMessage({ transactionType = "playSound", transactionFile = sound, transactionVolume = volume })
	end
end)