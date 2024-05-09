-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Cooldown = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
local Robberys = {
	["weaponshop"] = {
		["Cops"] = 1,
		["Radio"] = 101,
		["Duration"] = 10,
		["Name"] = "Loja de Armas",
		["Cooldown"] = 1800,
		["Mode"] = "Arms",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 60000,
			["Max"] = 80000
		}
	},
	["tattooshop"] = {
		["Cops"] = 4,
		["Radio"] = 201,
		["Duration"] = 100,
		["Name"] = "Loja de Tatuagem",
		["Cooldown"] = 1800,
		["Mode"] = "Tattos",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 50000,
			["Max"] = 75000
		}
	},
	["fleecas"] = {
		["Cops"] = 4,
		["Radio"] = 301,
		["Duration"] = 600,
		["Name"] = "Banco Fleeca",
		["Cooldown"] = 21600,
		["Mode"] = "banks",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 125000,
			["Max"] = 150000
		}
	},
	["departmentshop"] = {
		["Cops"] = 4,
		["Radio"] = 401,
		["Duration"] = 150,
		["Name"] = "Loja de Departamento",
		["Cooldown"] = 1800,
		["Mode"] = "shops",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 75000,
			["Max"] = 100000
		}
	},
	["clotheshop"] = {
		["Cops"] = 4,
		["Radio"] = 501,
		["Duration"] = 120,
		["Name"] = "Loja de Roupas",
		["Cooldown"] = 1800,
		["Mode"] = "Clotes",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 50000,
			["Max"] = 75000
		}
	},
	["barbershop"] = {
		["Cops"] = 4,
		["Radio"] = 601,
		["Duration"] = 120,
		["Name"] = "Barbearia",
		["Cooldown"] = 1800,
		["Mode"] = "barber",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 25000,
			["Max"] = 30000
		}
	},
	["banks"] = {
		["Cops"] = 10,
		["Radio"] = 701,
		["Duration"] = 600,
		["Name"] = "Banco",
		["Cooldown"] = 21600,
		["Mode"] = "banks",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 225000,
			["Max"] = 250000
		}
	},
	["jewelry"] = {
		["Cops"] = 8,
		["Radio"] = 801,
		["Duration"] = 300,
		["Name"] = "Joalheria",
		["Cooldown"] = 21600,
		["Mode"] = "banks",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 100000,
			["Max"] = 125000
		}
	},
	["acougue"] = {
		["Cops"] = 4,
		["Radio"] = 901,
		["Duration"] = 180,
		["Name"] = "Acougue",
		["Cooldown"] = 21600,
		["Mode"] = "acougue",
		["Payment"] = {
			["Item"] = "dollarsroll",
			["Min"] = 225000,
			["Max"] = 250000
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY:ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("inventory:Robberys")
AddEventHandler("inventory:Robberys",function(Crime)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and Robberys[Crime] then
		local Mode = Robberys[Crime]["Mode"]

		if not Cooldown[Mode] or os.time() > Cooldown[Mode] then
			local Service,Total = vRP.NumPermission("Police")
			if Total >= Robberys[Crime]["Cops"] then
				vRP.FreezePlayer(source,true)
				Cooldown[Mode] = os.time() + Robberys[Crime]["Cooldown"]

				if Robberys[Crime]["Radio"] then
					TriggerClientEvent("Notify",source,"azul","Rádio da Negociação: <b>"..Robberys[Crime]["Radio"].."</b>",20000)
				end

				local Coords = vRP.GetEntityCoords(source)
				for Passports,Sources in pairs(Service) do
					async(function()
						TriggerClientEvent("sounds:Private",Sources,"crime",0.5)

						if Robberys[Crime]["Radio"] then
							TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Rádio da Negociação: "..Robberys[Crime]["Radio"], color = 22 })
						else
							TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo a "..Robberys[Crime]["Name"], x = Coords["x"], y = Coords["y"], z = Coords["z"], color = 22 })
						end
					end)
				end

				vRPC.AnimActive(source)
				Player(source)["state"]["Buttons"] = true
				TriggerEvent("inventory:RobberysCooldown")
				Active[Passport] = os.time() + Robberys[Crime]["Duration"]
				TriggerEvent("Wanted",source,Passport,Robberys[Crime]["Duration"] * 3)
				vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)
				TriggerClientEvent("Progress",source,"Roubando",Robberys[Crime]["Duration"] * 1000)

				repeat
					if Active[Passport] and os.time() >= parseInt(Active[Passport]) then
						vRPC.Destroy(source)
						Active[Passport] = nil
						vRP.FreezePlayer(source,false)
						Player(source)["state"]["Buttons"] = false
						vRP.GenerateItem(Passport,Robberys[Crime]["Payment"]["Item"],math.random(Robberys[Crime]["Payment"]["Min"],Robberys[Crime]["Payment"]["Max"]),true)
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"vermelho","Contingente indisponível.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Aguarde <b>"..Cooldown[Mode] - os.time().."</b> segundos.",5000)
		end
	end
end)