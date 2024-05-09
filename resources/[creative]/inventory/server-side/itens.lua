-----------------------------------------------------------------------------------------------------------------------------------------
-- BOXES
-----------------------------------------------------------------------------------------------------------------------------------------
Boxes = {
	["treasurebox"] = {
		["Multiplier"] = 5,
		["List"] = {
			{ ["Item"] = "sapphire_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "emerald_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "ruby_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "gold_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "iron_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "lead_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "sulfur_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "tin_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "diamond_pure", ["Min"] = 8, ["Max"] = 16 },
			{ ["Item"] = "copper_pure", ["Min"] = 8, ["Max"] = 16 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BOXES
-----------------------------------------------------------------------------------------------------------------------------------------
Geodes = {
	{ ["Item"] = "sapphire_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "emerald_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "ruby_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "gold_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "iron_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "lead_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "sulfur_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "tin_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "gunpowder", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "diamond_pure", ["Min"] = 2, ["Max"] = 4 },
	{ ["Item"] = "copper_pure", ["Min"] = 2, ["Max"] = 4 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- USE
-----------------------------------------------------------------------------------------------------------------------------------------
Use = {
	["contrabandbox1"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"plastic",math.random(3,5),true)
				vRP.GenerateItem(Passport,"techtrash",math.random(3,5),true)
				vRP.GenerateItem(Passport,"explosives",math.random(3,5),true)
				vRP.GenerateItem(Passport,"aluminum",math.random(3,5),true)
				vRP.GenerateItem(Passport,"iron_pure",math.random(3,5),true)
				vRP.GenerateItem(Passport,"fabric",math.random(3,5),true)
				vRP.GenerateItem(Passport,"sheetmetal",math.random(3,5),true)
				vRP.GenerateItem(Passport,"tarp",math.random(3,5),true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["contrabandbox2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"tin_pure",math.random(3,5),true)
				vRP.GenerateItem(Passport,"glass",math.random(3,5),true)
				vRP.GenerateItem(Passport,"plastic",math.random(3,5),true)
				vRP.GenerateItem(Passport,"techtrash",math.random(3,5),true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["ammobox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"lead_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"copper_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"gunpowder",math.random(5,8),true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["ammobox2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"lead_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"copper_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"gunpowder",math.random(5,8),true)
				vRP.GenerateItem(Passport,"wheatflour",math.random(2,5),true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["weaponbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,"copper_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"iron_pure",math.random(5,8),true)
				vRP.GenerateItem(Passport,"pistolbody",math.random(5,8),true)
				vRP.GenerateItem(Passport,"smgbody",math.random(5,8),true)
				vRP.GenerateItem(Passport,"riflebody",math.random(5,8),true)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["c4"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "ch_prop_ch_ld_bomb_01a"
		local Application,Coords,Heading = vRPC.objectCoords(source,Hash)
		if Application then
			local CoordsAtm,NumberAtm = vCLIENT.checkAtm(source,Coords)

			if CoordsAtm then
				if not atmTimers[NumberAtm] then
					atmTimers[NumberAtm] = os.time()
				end

				if os.time() < atmTimers[NumberAtm] then
					local Cooldown = parseInt(atmTimers[NumberAtm] - os.time())
					TriggerClientEvent("Notify",source,"azul","Caixa vazio, aguarde <b>"..Cooldown.."</b> segundos até que um transportador venha até o local efetuar reabastecimento do mesmo.",5000)
					Player(source)["state"]["Buttons"] = false

					return
				end

				local Service,Total = vRP.NumPermission("Police")
				if Total <= 0 then
					TriggerClientEvent("Notify",source,"azul","Caixa vazio, aguarde até que um transportador venha até o local efetuar reabastecimento do mesmo.",5000)
					Player(source)["state"]["Buttons"] = false

					return
				end

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(Heading), object = Hash, item = Full, Distance = 100 }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
					TriggerClientEvent("Progress",source,"Plantando",25000)
					atmTimers[NumberAtm] = os.time() + 1800
					local explosionProgress = 25

					for Passports,Sources in pairs(Service) do
						async(function()
							vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
							TriggerClientEvent("NotifyPush",Sources,{ code = 20, title = "Caixa Eletrônico", x = Coords["x"], y = Coords["y"], z = Coords["z"], criminal = "Alarme de segurança", time = "Recebido às "..os.date("%H:%M"), blipColor = 16 })
						end)
					end

					repeat
						Wait(1000)
						explosionProgress = explosionProgress - 1
					until explosionProgress <= 0

					Kaduzera.DropServer(CoordsAtm,"dollarsroll",math.random(8000,12000))
					TriggerClientEvent("player:Residuals",source,"Resíduo de Explosivo.")
					TriggerClientEvent("objects:Remover",-1,tostring(Number))
					TriggerClientEvent("vRP:Explosion",source,Coords)
					TriggerEvent("Wanted",source,Passport,600)
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["adrenaline"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Distance = {
			{ 809.87,-494.42,30.68,17.01 },
			{ 1603.14,3568.94,38.77,212.6 },
			{ -470.91,6289.1,13.61,235.28 },
			{ 319.3,-557.8,28.75,331.66 }
		}
	
		local Service = vRP.NumPermission("Paramedic")
		if parseInt(#Service) > 0 and not Distance then
			return
		end

		local Ped = GetPlayerPed(source)
		local entity = vRPC.ClosestPed(source,2)
		if entity then
			local OtherPassport = vRP.Passport(entity)
			if OtherPassport then
				if vRP.GetHealth(entity) <= 150 then
					TriggerEvent("paramedic:Revive",entity)
				end
			end
		end
	end,

	["treasurebox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Selected = math.random(#Boxes[Full]["List"])
		local Rand = math.random(Boxes[Full]["List"][Selected]["Min"],Boxes[Full]["List"][Selected]["Max"])

		if (vRP.InventoryWeight(Passport) + (itemWeight(Boxes[Full]["List"][Selected]["Item"]) * Rand)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				vRP.GenerateItem(Passport,Boxes[Full]["List"][Selected]["Item"],Rand,false)
				TriggerClientEvent("inventory:Update",source,"Backpack")
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end,

	["backpack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.GetWeight(Passport) >= 300 then
			TriggerClientEvent("Notify",source,"amarelo","Limite de <b>"..itemName("backpack").."</b> atingido.",5000)
		    return
		end

		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("Progress",source,"Usando",10000)
		TriggerClientEvent("inventory:Close",source)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Player(source)["state"]["Buttons"] = false
				vRPC.stopAnim(source,false)
				Active[Passport] = nil

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.SetWeight(Passport,25)
					TriggerClientEvent("inventory:Update",source,"Backpack")
					TriggerClientEvent("Notify",source,"verde","<b>"..itemName("backpack").."</b> usada.",5000)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["binoculars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
			return
		end

		TriggerClientEvent("inventory:Camera",source,true)
	end,

	["camera"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Ped = GetPlayerPed(source)
		if GetSelectedPedWeapon(Ped) ~= GetHashKey("WEAPON_UNARMED") then
			return
		end

		TriggerClientEvent("inventory:Camera",source)
	end,

	["megaphone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("player:Megaphone",source)
		TriggerClientEvent("pma-voice:Megaphone",source,true)
		TriggerEvent("pma-voice:Megaserver",source,true)
		TriggerClientEvent("emotes",source,"megaphone")
	end,

	["badge01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"paper_1_rcm_alt1-8","player_one_dual-8","prop_police_badge",49,28422,0.065,0.029,-0.035,80.0,-1.90,75.0)
	end,

	["badge02"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"paper_1_rcm_alt1-8","player_one_dual-8","prop_medic_badge",49,28422,0.065,0.029,-0.035,80.0,-1.90,75.0)
	end,

	["nigirizushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sushi"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cupcake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkshake"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a","idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["milkshakepeanut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a","idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cappuccino"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a","idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["applelove"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["nitro"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Trocando",10000)
				TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Nitro = GlobalState["Nitro"]
							Nitro[Plate] = 2000
							GlobalState:set("Nitro",Nitro,true)
						end
					end

					Wait(100)
				until not Active[Passport]

				TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
			end
		end
	end,

	["postit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("postit:initPostit",source)
	end,

	["barrier"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Hash = "prop_mp_barrier_02b"
		local application,Coords,heading = vRPC.objectCoords(source,Hash)
		if application then
			if not vCLIENT.objectExist(source,Coords,Hash) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					local Number = 0

					repeat
						Number = Number + 1
					until not Objects[tostring(Number)]

					Objects[tostring(Number)] = { x = mathLength(Coords["x"]), y = mathLength(Coords["y"]), z = mathLength(Coords["z"]), h = mathLength(heading), object = Hash, item = Full, Distance = 100, mode = "3" }
					TriggerClientEvent("objects:Adicionar",-1,tostring(Number),Objects[tostring(Number)])
				end
			end
		end

		Player(source)["state"]["Buttons"] = false
	end,

	["dismantle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vCLIENT.DismantleStatus(source) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Close",source)

				Dismantle[Passport] = vRP.GetExperience(Passport,"Dismantle")
				if math.random(100) <= 15 then
					Dismantle[Passport] = math.random(1000)
				end

				vCLIENT.Dismantle(source,Dismantle[Passport])
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Você possui um contrato ativo.",5000)
		end
	end,

	["vpn"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate,vehName,vehClass = vRPC.VehicleList(source,4)
			if Vehicle then
				if vehClass == 15 or vehClass == 16 or vehClass == 19 then
					return
				end

				if string.sub(Plate,1,4) == "DISM" then
					Player(source)["state"]["Buttons"] = true
					vRPC.AnimActive(source)
					TriggerClientEvent("inventory:Close",source)
					vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
					if vTASKBAR.taskRobberys(source) then
						Active[Passport] = os.time() + 30
						TriggerClientEvent("Progress",source,"Usando",30000)

						if math.random(100) >= 25 then
							local Coords = vRP.GetEntityCoords(source)
							local Service = vRP.NumPermission("Police")
							for Passports,Sources in pairs(Service) do
								async(function()
									TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
								end)
							end
						end

						repeat
							if os.time() >= parseInt(Active[Passport]) then
								vRPC.stopAnim(source)
								Active[Passport] = nil

								TriggerEvent("plateEveryone",Plate)
								TriggerClientEvent("target:Dismantles",source)
								TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)
								Player(source)["state"]["Buttons"] = false

								local Network = NetworkGetEntityFromNetworkId(Network)
								if GetVehicleDoorLockStatus(Network) == 2 then
									SetVehicleDoorsLocked(Network,1)
								end
							end

							Wait(100)
						until not Active[Passport]
					else
						Player(source)["state"]["Buttons"] = false
						vRPC.stopAnim(source)
					end
				end
			end
		end
	end,

	["blocksignal"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not Player(source)["state"]["Handcuff"] then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle and vRPC.InsideVehicle(source) then
				if not exports["garages"]:Signal(Plate) then
					vRPC.AnimActive(source)
					vGARAGE.StartHotwired(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)

					if vTASKBAR.taskThree(source) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("Notify",source,"verde","<b>Bloqueador de Sinal</b> instalado.",5000)
							TriggerEvent("signalRemove",Plate)
						end
					end

					Player(source)["state"]["Buttons"] = false
					vGARAGE.StopHotwired(source)
					Active[Passport] = nil
				else
					TriggerClientEvent("Notify",source,"amarelo","<b>Bloqueador de Sinal</b> já instalado.",5000)
				end
			end
		end
	end,

	["sulfuric"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRPC.DowngradeHealth(source,50)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["notebook"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("notebook:openSystem",source)
	end,

	["vehkey"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Vehicle,Network,Plate = vRPC.VehicleList(source,5)
		if Vehicle then
			if Plate == Split[2] then
				TriggerEvent("garages:LockVehicle",source,Network)
			end
		end
	end,

	["evidence01"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ -914.71,-2027.36,9.4 },
			{ 855.83,-1292.66,28.24 },
			{ 1859.73,3694.95,38.22 },
			{ -453.16,5999.32,37.0 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,false,"Evidência de <b>"..Identity["name2"].."</b>.","amarelo",5000)
					break
				end
			end
		end
	end,

	["evidence02"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ -914.71,-2027.36,9.4 },
			{ 855.83,-1292.66,28.24 },
			{ 1859.73,3694.95,38.22 },
			{ -453.16,5999.32,37.0 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,false,"Evidência de <b>"..Identity["name2"].."</b>.","amarelo",5000)
					break
				end
			end
		end
	end,

	["evidence03"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ -914.71,-2027.36,9.4 },
			{ 855.83,-1292.66,28.24 },
			{ 1859.73,3694.95,38.22 },
			{ -453.16,5999.32,37.0 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,false,"Evidência de <b>"..Identity["name2"].."</b>.","amarelo",5000)
					break
				end
			end
		end
	end,

	["evidence04"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Microscope = {
			{ -914.71,-2027.36,9.4 },
			{ 855.83,-1292.66,28.24 },
			{ 1859.73,3694.95,38.22 },
			{ -453.16,5999.32,37.0 }
		}

		local Ped = GetPlayerPed(source)
		local Coords = GetEntityCoords(Ped)
		for k,v in pairs(Microscope) do
			local Distance = #(Coords - vec3(v[1],v[2],v[3]))
			if Distance <= 1 then
				local Identity = vRP.Identity(Split[2])
				if Identity then
					TriggerClientEvent("Notify",source,false,"Evidência de <b>"..Identity["name2"].."</b>.","amarelo",5000)
					break
				end
			end
		end
	end,

	["gemstone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,Amount,false,Slot) then
			TriggerClientEvent("inventory:Update",source,"Backpack")
			vRP.UpgradeGemstone(Passport,Amount)
		end
	end,

	["radio"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("radio:RadioNui",source)
		vRPC.AnimActive(source)
	end,

	["vest"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Vestindo",10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					Armors[Passport] = os.time() + 60
					vRP.SetArmour(source,99)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["bandage"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",5000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							TriggerClientEvent("sounds:Private",source,"bandage",0.5)
							Healths[Passport] = os.time() + 30
							vRP.UpgradeStress(Passport,2)
							vRPC.UpgradeHealth(source,25)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["medkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 10
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Passando",10000)
				vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 60
							vRPC.UpgradeHealth(source,60)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["fishingrod"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vCLIENT.Fishing(source) then
			if vRP.ConsultItem(Passport,"worm",1) then
			    vRPC.AnimActive(source)
			    Active[Passport] = os.time() + 100
			    Player(source)["state"]["Buttons"] = true
			    TriggerClientEvent("inventory:Close",source)

			    vRPC.CreateObjects(source,"amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",49,60309)

			    if vTASKBAR.taskFishing(source) then
					local fishList = { "anchovy","catfish","herring","orangeroughy","salmon","sardine","smallshark","smalltrout","yellowperch" }
					local fishRandom = math.random(#fishList)
					local fishSelects = fishList[fishRandom]

					if (vRP.InventoryWeight(Passport) + itemWeight(fishSelects)) <= vRP.GetWeight(Passport) then
						local Experience = vRP.GetExperience(Passport,"Fishing")
						local Category = ClassCategory(Experience)
						local Valuation = 100

						if Category == "B+" then
							Valuation = Valuation + 20
						elseif Category == "A" then
							Valuation = Valuation + 40
						elseif Category == "A+" then
							Valuation = Valuation + 60
						elseif Category == "S" then
							Valuation = Valuation + 80
						elseif Category == "S+" then
							Valuation = Valuation + 100
						end

						if Buffs["Dexterity"][Passport] then
							if Buffs["Dexterity"][Passport] > os.time() then
								Valuation = Valuation + (Valuation * 0.1)
							end
						end

						if vRP.TakeItem(Passport,"worm",1,false) then
						    vRP.PutExperience(Passport,"Fishing",1)
						    vRP.GenerateItem(Passport,fishSelects,1,true)
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("worm").."</b>.",5000)
			end

			Player(source)["state"]["Buttons"] = false
			vRPC.Destroy(source,"one")
			Active[Passport] = nil
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa estar na Área de <b>Pesca</b>.",5000)
		end
	end,

	["wheat"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["joint"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 30
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",30000)
			vRPC.CreateObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.Destroy(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.WeedTimer(Passport,2)
						vRP.UpgradeCough(Passport,2)
						vRP.DowngradeHunger(Passport,5)
						vRP.DowngradeThirst(Passport,5)
						vRP.DowngradeStress(Passport,10)

						TriggerClientEvent("Joint",source)
						vPLAYER.movementClip(source,"move_m@shadyped@a")
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000)
		end
	end,

	["geode"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"WEAPON_HAMMER",1) then
			local Selected = math.random(#Geodes)
			local Rand = math.random(Geodes[Selected]["Min"],Geodes[Selected]["Max"])

			if (vRP.InventoryWeight(Passport) + (itemWeight(Geodes[Selected]["Item"]) * Rand)) <= vRP.GetWeight(Passport) then
				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,Geodes[Selected]["Item"],Rand,true)
					TriggerClientEvent("inventory:Update",source,"Backpack")
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","<b>Martelo</b> não encontrado.",5000)
		end
	end,

	["cocaine"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Cheirando",5000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,10)
					TriggerClientEvent("Cocaine",source)
					TriggerClientEvent("Energetic",source,30,1.40)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["lean"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.ChemicalTimer(Passport,10)
					TriggerClientEvent("Lean",source)
					vRP.DowngradeStress(Passport,2)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["meth"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Methamphetamine",source)
					Armors[Passport] = os.time() + 20
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sonhodogomes"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("inventory:client:red_meth",source)
					Armors[Passport] = os.time() + 20
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sonhodokadu"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Methamphetamine",source)
					Armors[Passport] = os.time() + 20
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["rolepass"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.CheckRolepass(source) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerEvent("vRP:ActivePass",source)
				TriggerClientEvent("Notify",source,"verde","Você ativou <b>Rolepass</b>.",5000)
			end
		end
	end,

	["creator"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			TriggerClientEvent("barbershop:Open",source,"Open",true)
		end
	end,

	["creators"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Streamer")
				--vRP.SetPermission(Passport,"Streamer",1)
				--vRP.GenerateItem(Passport,"backpack",4,true)
				--vRP.GenerateItem(Passport,"gemstone",50,true)
				TriggerClientEvent("Notify",source,"amarelo","<b>Favelinha Creators</b> Disponível em <b>03/06</b>.",5000)
			end
		end
	end,

	["verify"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (vRP.InventoryWeight(Passport) + itemWeight(Full)) <= vRP.GetWeight(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Streamer")
				vRP.SetPermission(Passport,"Verify",1)
				TriggerClientEvent("Notify",source,"amarelo","<b>Voce Ativou seu verificado</b>.",5000)
			end
		end
	end,

	["premiumbronze"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",4)
				vRP.SetWeight(Passport,25)
				vRP.SetPremium(source)
				vRP.GenerateItem(Passport,"dollars",50000,true)
				vRP.GenerateItem(Passport,"WEAPON_PICKAXE_PLUS",1,true)
				TriggerClientEvent("Notify",source,"verde","Você ativou seu <b>Premium Bronze</b> e Recebeu Salario e seus Benefícios",10000)
			end
		else
			if vRP.HasPermission(Passport,"Premium") and vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium",4)
				vRP.SetPermission(Passport,"Premium",4)
				vRP.UpgradePremium(source)
				TriggerClientEvent("Notify",source,"verde","Você ativou <b>Premium Bronze</b>.",10000)

				if vRP.GetWeight(Passport) >= 125 then
					TriggerClientEvent("Notify",source,"amarelo","Sua mochila de <b>25kg</b> não foi adicionada pois você atingiu o limite.",10000)
					return
				end

				vRP.SetWeight(Passport,25)
			end
		end
	end,

	["premiumprata"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",3)
				vRP.SetWeight(Passport,40)
				vRP.SetPremium(source)
				vRP.GenerateItem(Passport,"chip",1,true)
				vRP.GenerateItem(Passport,"dollars",80000,true)
				vRP.GenerateItem(Passport,"gemstone",50,true)
				vRP.GenerateItem(Passport,"WEAPON_PICKAXE_PLUS",1,true)
				TriggerClientEvent("Notify",source,"verde","Você ativou seu <b>Premium Prata</b> e Recebeu Salario e seus Benefícios",10000)
			end
		else
			if vRP.HasPermission(Passport,"Premium") and vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",3)
				vRP.UpgradePremium(source)
				TriggerClientEvent("Notify",source,"verde","Você ativou <b>Premium</b>.",10000)

				if vRP.GetWeight(Passport) >= 140 then
					TriggerClientEvent("Notify",source,"amarelo","Sua mochila de <b>40kg</b> não foi adicionada pois você atingiu o limite.",10000)
					return
				end

				vRP.SetWeight(Passport,40)
			end
		end
	end,

	["premiumouro"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",2)
				vRP.SetWeight(Passport,50)
				vRP.SetPremium(source)
				vRP.GenerateItem(Passport,"chip",1,true)
				vRP.GenerateItem(Passport,"verify",1,true)
				vRP.GenerateItem(Passport,"premiumplate",1,true)
				vRP.GenerateItem(Passport,"dollars",100000,true)
				vRP.GenerateItem(Passport,"WEAPON_PICKAXE_PLUS",1,true)
				TriggerClientEvent("Notify",source,"verde","Você ativou seu <b>Premium Ouro</b> e Recebeu Salario e seus Benefícios",10000)
			end
		else
			if vRP.HasPermission(Passport,"Premium") and vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",2)
				vRP.UpgradePremium(source)
				TriggerClientEvent("Notify",source,"verde","Você ativou <b>Premium Ouro</b>.",10000)

				if vRP.GetWeight(Passport) >= 150 then
					TriggerClientEvent("Notify",source,"amarelo","Sua mochila de <b>50kg</b> não foi adicionada pois você atingiu o limite.",10000)
					return
				end

				vRP.SetWeight(Passport,50)
			end
		end
	end,

	["premiumplatina"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.UserPremium(Passport) then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",1)
				vRP.SetWeight(Passport,100)
				vRP.SetPremium(source)
				vRP.GenerateItem(Passport,"chip",1,true)
				vRP.GenerateItem(Passport,"verify",1,true)
				vRP.GenerateItem(Passport,"premiumplate",1,true)
				vRP.GenerateItem(Passport,"dollars",200000,true)
				vRP.GenerateItem(Passport,"WEAPON_PICKAXE_PLUS",1,true)
				TriggerClientEvent("Notify",source,"verde","Você ativou seu <b>Premium Platina</b> e Recebeu Salario e seus Benefícios",10000)
			end
		else
			if vRP.HasPermission(Passport,"Premium") and vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("inventory:Update",source,"Backpack")
				TriggerEvent("Salary:Add",Passport,"Premium")
				vRP.SetPermission(Passport,"Premium",1)
				vRP.UpgradePremium(source)
				TriggerClientEvent("Notify",source,"verde","Você ativou <b>Premium Platina</b>.",10000)

				if vRP.GetWeight(Passport) >= 300 then
					TriggerClientEvent("Notify",source,"amarelo","Sua mochila de <b>60kg</b> não foi adicionada pois você atingiu o limite.",10000)
					return
				end

				vRP.SetWeight(Passport,60)
			end
		end
	end,

	["premiumplate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local vehModel = vRPC.VehicleName(source)
		local vehicle = vRP.Query("vehicles/selectVehicles",{ Passport = Passport, vehicle = vehModel })
		if vehicle[1] then
			local Keyboard = vKEYBOARD.keySingle(source,"Placa: (8 Caracteres)")
			if Keyboard then
				local namePlate = string.sub(Keyboard[1],1,8)
				local plateCheck = sanitizeString(namePlate,"abcdefghijklmnopqrstuvwxyz0123456789",true)

				if string.len(plateCheck) ~= 8 then
					TriggerClientEvent("Notify",source,"vermelho","O nome de definição para a placa inválida.",5000)
					return
				else
					if vRP.PassportPlate(namePlate) then
						TriggerClientEvent("Notify",source,"amarelo","A placa escolhida já possui em outro veículo.",5000)
						return
					else
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.Query("vehicles/plateVehiclesUpdate",{ Passport = Passport, vehicle = vehModel, plate = string.upper(namePlate) })
							TriggerClientEvent("Notify",source,"verde","Placa atualizada.",5000)
						end
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"vermelho","Modelo de veículo não encontrado.",5000)
		end
	end,

	["newchars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.TakeItem(Passport,Full,1,false,Slot) then
			vRP.UpgradeChars(source)
			TriggerClientEvent("inventory:Update",source,"Backpack")
			TriggerClientEvent("Notify",source,"verde","Personagem liberado.",5000)
		end
	end,

	["namechange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.keyDouble(source,"Nome:","Sobrenome:")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,true,Slot) then
				TriggerClientEvent("Notify",source,"verde","Passaporte atualizado.",5000)
				TriggerClientEvent("inventory:Update",source,"Backpack")
				vRP.UpgradeNames(Passport,Keyboard[1],Keyboard[2])
			end
		end
	end,

	["chip"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.keyDouble(source,"Três primeiros digitos:","Três ultimos digitos:")
		if Keyboard then
			local Fir = sanitizeString(Keyboard[1],"0123456789",true)
			local Sec = sanitizeString(Keyboard[2],"0123456789",true)
			if string.len(Fir) == 3 and string.len(Sec) == 3 then
				if not vRP.UserPhone(Keyboard[1].."-"..Keyboard[2]) then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("Notify",source,"verde","Telefone atualizado.",5000)
						TriggerClientEvent("inventory:Update",source,"Backpack")
						vRP.UpgradePhone(Passport,Keyboard[1].."-"..Keyboard[2])
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","O número escolhido já possui um proprietário.",5000)
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","O número telefônico deve conter 6 dígitos e somente números.",5000)
			end
		end
	end,

	["milkbottle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					vRP.UpgradeThirst(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["guarananatural"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@coffee@male@idle_a","idle_c","prop_food_bs_juice02",49,28422,0.0,-0.01,-0.15,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeThirst(Passport,25)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["water"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Player(source)["state"]["Buttons"] = false
				vRPC.Destroy(source,"one")
				Active[Passport] = nil

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					vRP.UpgradeThirst(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["dirtywater"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.GenerateItem(Passport,"emptybottle",1)
					TriggerClientEvent("resetDrugs",source)
					vRPC.DowngradeHealth(Passport,5)
					vRP.UpgradeThirst(Passport,15)
					vRP.UpgradeCough(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["emptybottle"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local Status,Style = vCLIENT.checkFountain(source)
		if Status then
			if Style == "fountain" then
				if vRP.MaxItens(Passport,"water",Amount) then
					TriggerClientEvent("Notify",source,"vermelho","Limite atingido.",5000)
					return
				end
				
				vRPC.playAnim(source,true,{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"},true)
			elseif Style == "floor" then
				if vRP.MaxItens(Passport,"dirtywater",Amount) then
					TriggerClientEvent("Notify",source,"vermelho","Limite atingido.",5000)
					return
				end

				vRPC.playAnim(source,true,{"amb@world_human_bum_wash@male@high@base","base"},true)
			end

			vRPC.AnimActive(source)
			Active[Passport] = os.time() + 30
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Coletando",30000)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.Destroy(source,"one")
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						if Style == "floor" then
							vRP.GenerateItem(Passport,"dirtywater",Amount,true)
						else
							vRP.GenerateItem(Passport,"water",Amount,true)
						end
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["coffee"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"amb@world_human_aa_coffee@idle_a","idle_a","p_amb_coffeecup_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeThirst(Passport,20)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,
	
	["energetic"] = function(source,Passport,Amount,Slot,Full,Item,Split)	
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",15000)
		TriggerClientEvent("inventory:Buttons",source,true)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","prop_energy_drink",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,30,1.30)
					vRP.UpgradeThirst(Passport,15)

				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","prop_ecola_can",49,60309,0.01,0.01,0.05,0.0,0.0,90.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tacos"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_taco_01",49,18905,0.16,0.06,0.02,-50.0,220.0,60.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["fries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["friesbacon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_food_bs_chips",49,18905,0.10,0.0,0.08,150.0,320.0,160.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,25)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["soda"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","ng_proc_sodacan_01b",49,60309,0.0,0.0,-0.04,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,15)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["apple"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["orange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["strawberry"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["coffee2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["grape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tange"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["banana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["guarana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["acerola"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["passion"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tomato"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",10000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,3)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cookies"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,30)
					vRP.DowngradeStress(Passport,20)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["orangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["tangejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["grapejuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["strawberryjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["bananajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["acerolajuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["passionjuice"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,50)
					vRP.DowngradeStress(Passport,20)
					vRP.GenerateItem(Passport,"emptybottle",1)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cannedsoup"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["canofbeans"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source,false)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["marshmallow"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 3
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",3000)
		vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,5)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,15)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger2"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger3"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger4"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hamburger5"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_cs_burger_01",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,50)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["onionrings"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chickenfries"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Dexterity",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzamozzarella"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzabanana"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,40)
					vRP.DowngradeStress(Passport,20)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pizzachocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)
					vRP.DowngradeStress(Passport,20)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["calzone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.playAnim(source,true,{"mp_player_inteat@burger","mp_player_int_eat_burger"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,30)

					if vCLIENT.Restaurant(source,"Pearls") then
						TriggerEvent("inventory:BuffServer",source,Passport,"Luck",600)
					end
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hotdog"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_hotdog_01",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["donut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_amb_donut",49,28422)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Energetic",source,20,1.10)
					vRP.UpgradeHunger(Passport,10)
					vRP.DowngradeStress(Passport,20)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["lockpick"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local homeName = exports["propertys"]:homesTheft(source)
		if homeName then
			vRPC.stopActived(source)
			vRP.upgradeStress(Passport,2)
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("inventory:Buttons",source,true)
			vRPC.playAnim(source,false,{"missheistfbi3b_ig7","lift_fibagent_loop"},false)

			if vTASKBAR.taskThree(source) then
				exports["propertys"]:enterHomes(source,Passport,homeName,true)
			else
				exports["propertys"]:resetTheft(homeName)

				if math.random(100) >= 50 then
					TriggerClientEvent("Notify",source,"amarelo","A vizinhança foi avisada de um suposto roubo.",5000)
					TriggerClientEvent("inventory:DisPed",source)
					local Players = vRPC.Players(source)
					for _,v in ipairs(Players) do
						async(function()
							TriggerClientEvent("sounds:source",v,"alarm",1.0)
						end)
					end
				end
			end

			TriggerClientEvent("inventory:Buttons",source,false)
			vRPC.stopAnim(source,false)
		end

		local Vehicle,Network,Plate,vehName,vehClass = vRPC.VehicleList(source,8)
		if Vehicle then
			local Brokenpick = 950
			if vehClass == 15 or vehClass == 16 or vehClass == 19 then
				return
			end

			if vRP.InsideVehicle(source) then
				vRPC.AnimActive(source)
				vGARAGE.StartHotwired(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)

				if vTASKBAR.taskLockpick(source) then
					if math.random(100) >= 20 then
						Brokenpick = 900
						TriggerEvent("plateEveryone",Plate)
						TriggerEvent("platePlayers",Plate,Passport)
						TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

						local Network = NetworkGetEntityFromNetworkId(Network)
						if GetVehicleDoorLockStatus(Network) == 2 then
							SetVehicleDoorsLocked(Network,1)
						end
					end

					if math.random(100) >= 75 then
						local Coords = vRP.GetEntityCoords(source)
						local Service = vRP.NumPermission("Police")
						for Passports,Sources in pairs(Service) do
							async(function()
								TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
							end)
						end
					end
				end

				if math.random(1000) >= Brokenpick then
					if vRP.TakeItem(Passport,Full,1,false) then
						vRP.GiveItem(Passport,"lockpick-0",1,false)
						TriggerClientEvent("itensNotify",source,{ "quebrou","lockpick",1,"Lockpick de Alumínio" })
					end
				end

				Player(source)["state"]["Buttons"] = false
				vGARAGE.StopHotwired(source,vehicle)
				Active[Passport] = nil
			else
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				vRPC.playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)

				if string.sub(Plate,1,4) == "DISM" then
					if vTASKBAR.UpgradeVehicle(source) then
						Brokenpick = 900
						Active[Passport] = os.time() + 30
						TriggerClientEvent("Progress",source,"Usando",30000)

						if math.random(100) >= 25 then
							local Coords = vRP.GetEntityCoords(source)
							local Service = vRP.NumPermission("Police")
							for Passports,Sources in pairs(Service) do
								async(function()
									TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
								end)
							end
						end

						repeat
							if os.time() >= parseInt(Active[Passport]) then
								Active[Passport] = nil

								TriggerEvent("plateEveryone",Plate)
								TriggerClientEvent("target:Dismantles",source)
								TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

								local Network = NetworkGetEntityFromNetworkId(Network)
								if GetVehicleDoorLockStatus(Network) == 2 then
									SetVehicleDoorsLocked(Network,1)
								end
							end

							Wait(100)
						until not Active[Passport]
					end
				else
					if vTASKBAR.taskLockpick(source) then
						Brokenpick = 900

						if math.random(100) >= 75 then
							TriggerEvent("plateEveryone",Plate)
							TriggerClientEvent("inventory:vehicleAlarm",source,Network,Plate)

							local Network = NetworkGetEntityFromNetworkId(Network)
							if GetVehicleDoorLockStatus(Network) == 2 then
								SetVehicleDoorsLocked(Network,1)
							end
						end

						if math.random(100) >= 25 then
							local Coords = vRP.GetEntityCoords(source)
							local Service = vRP.NumPermission("Police")
							for Passports,Sources in pairs(Service) do
								async(function()
									TriggerClientEvent("NotifyPush",Sources,{ code = 31, title = "Roubo de Veículo", x = Coords["x"], y = Coords["y"], z = Coords["z"], vehicle = VehicleName(vehName).." - "..Plate, time = "Recebido às "..os.date("%H:%M"), blipColor = 44 })
								end)
							end
						end
					end
				end

				if math.random(1000) >= Brokenpick then
					if vRP.TakeItem(Passport,Full,1,false) then
						vRP.GiveItem(Passport,"lockpick-0",1,false)
						TriggerClientEvent("itensNotify",source,{ "quebrou","lockpick",1,"Lockpick de Alumínio" })
					end
				end

				Player(source)["state"]["Buttons"] = false
				vRPC.Destroy(source)
				Active[Passport] = nil
			end
		end
	end,


	["toolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
			if Vehicle then
				vRPC.AnimActive(source)
				Active[Passport] = os.time() + 100
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
				vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

				if vTASKBAR.taskMechanic(source) then
					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Players = vRPC.Players(source)
						for _,v in pairs(Players) do
							async(function()
								TriggerClientEvent("inventory:repairEngine",v,Network,Plate)
							end)
						end
					end
				end

				TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
				Player(source)["state"]["Buttons"] = false
				vRPC.stopAnim(source,false)
				Active[Passport] = nil
			end
		end
	end,

	["advtoolbox"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Split then
			if not vRPC.InsideVehicle(source) then
				local Vehicle,Network,Plate = vRPC.VehicleList(source,4)
				if Vehicle then
					vRPC.AnimActive(source)
					Active[Passport] = os.time() + 100
					Player(source)["state"]["Buttons"] = true
					TriggerClientEvent("inventory:Close",source)
					TriggerClientEvent("player:syncHoodOptions",source,Network,"open")
					vRPC.playAnim(source,false,{"mini@repair","fixing_a_player"},true)

					if vTASKBAR.taskMechanic(source) then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local Players = vRPC.Players(source)
							for _,v in pairs(Players) do
								async(function()
									TriggerClientEvent("inventory:repairVehicle",v,Network,Plate)
								end)
							end

							local Number = parseInt(Split[2]) - 1

							if Number >= 1 then
								vRP.GiveItem(Passport,"advtoolbox-"..Number,1,false)
							end
						end
					end

					TriggerClientEvent("player:syncHoodOptions",source,Network,"close")
					Player(source)["state"]["Buttons"] = false
					vRPC.stopAnim(source,false)
					Active[Passport] = nil
				end
			end
		end
	end,

	["notepad"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 100
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)

		local Keyboard = vKEYBOARD.keySingle(source,"Mensagem:")
		if Keyboard then
			if vRP.TakeItem(Passport,Full,1,false,Slot) then
				if Split[2] then
					vRP.SetSrvData(Full,Keyboard[1])
					vRP.GenerateItem(Passport,Full,1,false)
				else
					local Time = os.time()
					vRP.SetSrvData("notepad-"..Time,Keyboard[1])
					vRP.GenerateItem(Passport,"notepad-"..Time,1,false)
				end
			end

			TriggerClientEvent("inventory:Update",source,"Backpack")
		end

		Player(source)["state"]["Buttons"] = false
		Active[Passport] = nil
	end,

	["tyres"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			if not vCLIENT.checkWeapon(source,"WEAPON_WRENCH") then
				TriggerClientEvent("Notify",source,"vermelho","<b>Chave Inglesa</b> não encontrada.",5000)
				return
			end

			local tyreStatus,Tyre,Network,Plate = vCLIENT.tyreStatus(source)
			if tyreStatus then
				local Vehicle = NetworkGetEntityFromNetworkId(Network)
				if DoesEntityExist(Vehicle) and not IsPedAPlayer(Vehicle) and GetEntityType(Vehicle) == 2 then
					if vCLIENT.tyreHealth(source,Network,Tyre) ~= 1000.0 then
						vRPC.AnimActive(source)
						Active[Passport] = os.time() + 100
						Player(source)["state"]["Buttons"] = true
						TriggerClientEvent("inventory:Close",source)
						vRPC.playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

						if vTASKBAR.taskTyre(source) then
							if vRP.TakeItem(Passport,Full,1,true,Slot) then
								local Players = vRPC.Players(source)
								for _,v in pairs(Players) do
									async(function()
										TriggerClientEvent("inventory:repairTyre",v,Network,Tyre,Plate)
									end)
								end
							end
						end

						Player(source)["state"]["Buttons"] = false
						vRPC.stopAnim(source,false)
						Active[Passport] = nil
					end
				end
			end
		end
	end,

	["scuba"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("hud:Scuba",source)
	end,

	["handcuff"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) then
			local ClosestPed = vRPC.ClosestPed(source,1)
			if ClosestPed then
				Player(source)["state"]["Cancel"] = true
				Player(source)["state"]["Buttons"] = true

				if Player(ClosestPed)["state"]["Handcuff"] then
					Player(ClosestPed)["state"]["Handcuff"] = false
					Player(ClosestPed)["state"]["Commands"] = false
					TriggerClientEvent("sounds:Private",source,"uncuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"uncuff",0.5)

					vRPC.Destroy(ClosestPed)
				else
					TriggerClientEvent("hud:RadioClean",ClosestPed)
					TriggerClientEvent("player:Carry",ClosestPed,source,"handcuff")
					vRPC.playAnim(source,false,{"mp_arrest_paired","cop_p2_back_left"},false)
					vRPC.playAnim(ClosestPed,false,{"mp_arrest_paired","crook_p2_back_left"},false)

					Wait(3500)

					vRPC.Destroy(source)
					Player(ClosestPed)["state"]["Handcuff"] = true
					Player(ClosestPed)["state"]["Commands"] = true
					TriggerClientEvent("inventory:Close",ClosestPed)
					TriggerClientEvent("sounds:Private",source,"cuff",0.5)
					TriggerClientEvent("sounds:Private",ClosestPed,"cuff",0.5)
					TriggerClientEvent("player:Carry",ClosestPed,source)
				end

				Player(source)["state"]["Cancel"] = false
				Player(source)["state"]["Buttons"] = false
			end
		end
	end,

	["rope"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRP.InsideVehicle(source) then
			if Carry[Passport] then
				TriggerClientEvent("player:ropeCarry",Carry[Passport],source)
				TriggerClientEvent("player:Commands",Carry[Passport],false)
				vRPC.Destroy(Carry[Passport])
				vRPC.Destroy(source)
				Carry[Passport] = nil
			else
				local ClosestPed = vRPC.ClosestPed(source,3)
				if ClosestPed then
					if vRP.GetHealth(ClosestPed) <= 100 or Player(ClosestPed)["state"]["Handcuff"] then
						Carry[Passport] = ClosestPed

						TriggerClientEvent("player:ropeCarry",Carry[Passport],source)
						TriggerClientEvent("player:Commands",Carry[Passport],true)
						TriggerClientEvent("inventory:Close",Carry[Passport])

						vRPC.playAnim(ClosestPed,false,{"nm","firemans_carry"},true)
						vRPC.playAnim(source,true,{"missfinale_c2mcs_1","fin_c2_mcs_1_camman"},true)
					end
				end
			end
		end
	end,

	["hood"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed and Player(ClosestPed)["state"]["Handcuff"] then
			TriggerClientEvent("hud:Hood",ClosestPed)
			TriggerClientEvent("inventory:Close",ClosestPed)
		end
	end,

	["ritmoneury"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Tomando",5000)
		vRPC.CreateObjects(source,"mp_player_intdrink","loop_bottle","vw_prop_casino_water_bottle_01a",49,60309,0.0,0.0,-0.06,0.0,0.0,130.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeThirst(Passport,5)
					vRP.ChemicalTimer(Passport,3)
					vRP.DowngradeStress(Passport,30)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["cigarette"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.CreateObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.Destroy(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vRP.DowngradeStress(Passport,10)
						vRP.UpgradeCough(Passport,2)
						
						local Ped = GetPlayerPed(source)
						local Coords = GetEntityCoords(Ped)
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000)
		end
	end,

	["vape"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 15
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Fumando",15000)
		vRPC.CreateObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","ba_prop_battle_vape_01",49,18905,0.08,-0.00,0.03,-150.0,90.0,-10.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRP.DowngradeStress(Passport,20)
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chocolate"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,8)
					vRP.DowngradeStress(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["sandwich"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 5
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Comendo",5000)
		vRPC.CreateObjects(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_sandwich_01",49,18905,0.13,0.05,0.02,-50.0,16.0,60.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.UpgradeHunger(Passport,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["rose"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
	end,

	["teddy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)
		vRPC.CreateObjects(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end,

	["absolut"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["chandon"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["dewars"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_beer_blr",49,28422,0.0,0.0,-0.10,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["hennessy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		vRPC.AnimActive(source)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Bebendo",10000)
		vRPC.CreateObjects(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422,0.0,0.0,0.05,0.0,0.0,0.0)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.Destroy(source,"one")
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vRP.AlcoholTimer(Passport,1)
					vRP.UpgradeThirst(Passport,20)
					TriggerClientEvent("setDrunkTime",source,90)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["GADGET_PARACHUTE"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Usando",10000)
		vRPC.playAnim(source,true,{"clothingtie","try_tie_negative_a"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				Player(source)["state"]["Buttons"] = false
				vRPC.stopAnim(source,false)

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					vCLIENT.parachuteColors(source)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["pager"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			if Player(ClosestPed)["state"]["Handcuff"] then
				local OtherPassport = vRP.Passport(ClosestPed)
				if OtherPassport then
					if vRP.HasService(OtherPassport,"Police") then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.ServiceLeave(ClosestPed,OtherPassport,"Police")
							TriggerClientEvent("Notify",source,"amarelo","Todas as comunicações foram retiradas.",5000)
						end
					end

					if vRP.HasService(OtherPassport,"Paramedic") then
						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							vRP.ServiceLeave(ClosestPed,OtherPassport,"Paramedic")
							TriggerClientEvent("Notify",source,"amarelo","Todas as comunicações foram retiradas.",5000)
						end
					end
				end
			end
		end
	end,

	["firecracker"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if not vRPC.InsideVehicle(source) and not vCLIENT.checkCracker(source) then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Acendendo",3000)
			vRPC.playAnim(source,false,{"anim@mp_fireworks","place_firework_3_box"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.stopAnim(source,false)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("inventory:Firecracker",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["analgesic"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,1)
							vRPC.UpgradeHealth(source,10)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["oxy"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if (not Healths[Passport] or os.time() > Healths[Passport]) then
			if vRP.GetHealth(source) > 100 and vRP.GetHealth(source) < 200 then
				Active[Passport] = os.time() + 3
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Tomando",3000)
				vRPC.playAnim(source,true,{"mp_suicide","pill"},true)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						vRPC.stopAnim(source,false)
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							Healths[Passport] = os.time() + 15
							vRP.UpgradeStress(Passport,1)
							vRPC.UpgradeHealth(source,8)

							TriggerClientEvent("Oxycontin",source)
						end
					end

					Wait(100)
				until not Active[Passport]
			else
				TriggerClientEvent("Notify",source,"amarelo","Não pode utilizar de vida cheia ou nocauteado.",5000)
			end
		else
			local Timer = parseInt(Healths[Passport] - os.time())
			TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..Timer.."</b> segundos.",5000)
		end
	end,

	["crack"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vRP.ConsultItem(Passport,"lighter",1) then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Fumando",10000)
			vRPC.CreateObjects(source,"amb@world_human_aa_smoke@male@idle_a","idle_c","prop_cs_ciggy_01",49,28422)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.Destroy(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Ped = GetPlayerPed(source)
						local Coords = GetEntityCoords(Ped)
						vRP.DowngradeHunger(Passport,100)
						vRP.DowngradeThirst(Passport,100)
						TriggerClientEvent("inventory:client:hallucinogenic_chicken_weed",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName("lighter").."</b>.",5000)
		end
	end,

	["heroin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Heroin[Passport] then
			if os.time() < Heroin[Passport] then
				local HeroinTimers = parseInt(Heroin[Passport] - os.time())
				TriggerClientEvent("Notify",source,false,"Aguarde <b>"..HeroinTimers.."</b> segundos.","azul",5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Injetando",10000)
		vRPC.playAnim(source,true,{"rcmpaparazzo1ig_4","miranda_shooting_up"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("Heroin",source)
					Heroin[Passport] = os.time() + 60
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["metadone"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",false,5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("inventory:client:hallucinogenic_pug_weed",source)
					Armors[Passport] = os.time() + 60
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["lancaperfume"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if Armors[Passport] then
			if os.time() < Armors[Passport] then
				local armorTimers = parseInt(Armors[Passport] - os.time())
				TriggerClientEvent("Notify",source,"azul","Aguarde <b>"..armorTimers.."</b> segundos.",false,5000)
				return
			end
		end

		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Inalando",10000)
		vRPC.playAnim(source,true,{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"},true)

		repeat
			if os.time() >= parseInt(Active[Passport]) then
				Active[Passport] = nil
				vRPC.stopAnim(source)
				Player(source)["state"]["Buttons"] = false

				if vRP.TakeItem(Passport,Full,1,true,Slot) then
					TriggerClientEvent("inventory:client:hallucinogenic_chicken_weed",source)
					Armors[Passport] = os.time() + 60
					vRP.ChemicalTimer(Passport,10)
					vRP.SetArmour(source,10)
				end
			end

			Wait(100)
		until not Active[Passport]
	end,

	["gauze"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPARAMEDIC.Bleeding(source) > 0 then
			Active[Passport] = os.time() + 3
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Passando",3000)
			vRPC.playAnim(source,true,{"amb@world_human_clipboard@male@idle_a","idle_c"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.stopAnim(source,false)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						vPARAMEDIC.Bandage(source)
						vRPC.UpgradeHealth(source,10)
					end
				end

				Wait(100)
			until not Active[Passport]
		else
			TriggerClientEvent("Notify",source,false,"Nenhum ferimento encontrado.","amarelo",5000)
		end
	end,

	["gsrkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			Active[Passport] = os.time() + 5
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",5000)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						local Informations = vPLAYER.checkSoap(ClosestPed)
						if Informations then
							local Number = 0
							local Message = ""

							for Value,v in pairs(Informations) do
								Number = Number + 1
								Message = Message.."<b>"..Number.."</b>: "..Value.."<br>"
							end

							TriggerClientEvent("Notify",source,"Kit Residual",Message,"amarelo",10000)
						else
							TriggerClientEvent("Notify",source,"Kit Residual","Nenhum resultado encontrado.","amarelo",5000)
						end
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end,

	["gdtkit"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		local ClosestPed = vRPC.ClosestPed(source,2)
		if ClosestPed then
			local OtherPassport = vRP.Passport(ClosestPed)
			local Identity = vRP.Identity(OtherPassport)
			if OtherPassport and Identity then
				Active[Passport] = os.time() + 5
				Player(source)["state"]["Buttons"] = true
				TriggerClientEvent("inventory:Close",source)
				TriggerClientEvent("Progress",source,"Usando",5000)

				repeat
					if os.time() >= parseInt(Active[Passport]) then
						Active[Passport] = nil
						Player(source)["state"]["Buttons"] = false

						if vRP.TakeItem(Passport,Full,1,true,Slot) then
							local weed = vRP.WeedReturn(OtherPassport)
							local chemical = vRP.ChemicalReturn(OtherPassport)
							local alcohol = vRP.AlcoholReturn(OtherPassport)

							local chemStr = ""
							local alcoholStr = ""
							local weedStr = ""

							if chemical == 0 then
								chemStr = "Nenhum"
							elseif chemical == 1 then
								chemStr = "Baixo"
							elseif chemical == 2 then
								chemStr = "Médio"
							elseif chemical >= 3 then
								chemStr = "Alto"
							end

							if alcohol == 0 then
								alcoholStr = "Nenhum"
							elseif alcohol == 1 then
								alcoholStr = "Baixo"
							elseif alcohol == 2 then
								alcoholStr = "Médio"
							elseif alcohol >= 3 then
								alcoholStr = "Alto"
							end

							if weed == 0 then
								weedStr = "Nenhum"
							elseif weed == 1 then
								weedStr = "Baixo"
							elseif weed == 2 then
								weedStr = "Médio"
							elseif weed >= 3 then
								weedStr = "Alto"
							end

							TriggerClientEvent("Notify",source,"azul","<b>Químicos:</b> "..chemStr.."<br><b>Álcool:</b> "..alcoholStr.."<br><b>Drogas:</b> "..weedStr,15000)
						end
					end

					Wait(100)
				until not Active[Passport]
			end
		end
	end,

	["silvercoin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Coins = math.random(2)
		local Sides = { "Cara","Coroa" }
		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],Sides[Coins])
			end)
		end
	end,

	["goldcoin"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Coins = math.random(2)
		local Sides = { "Cara","Coroa" }
		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],Sides[Coins])
			end)
		end
	end,

	["dices"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		Active[Passport] = os.time() + 10
		Player(source)["state"]["Buttons"] = true
		TriggerClientEvent("inventory:Close",source)
		TriggerClientEvent("Progress",source,"Jogando",1750)
		vRPC.playAnim(source,true,{"anim@mp_player_intcelebrationmale@wank","wank"},true)

		Wait(1750)

		Active[Passport] = nil
		vRPC.stopAnim(source,false)
		Player(source)["state"]["Buttons"] = false

		local Dice = math.random(6)
		local Players = vRPC.Players(source)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("showme:pressMe",v,source,"<img src='images/"..Dice..".png'>",10,true)
			end)
		end
	end,

	["deck"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		TriggerClientEvent("inventory:Close",source)

		local card = math.random(13)
		local cards = { "A","2","3","4","5","6","7","8","9","10","J","Q","K" }

		local naipe = math.random(4)
		local naipes = { "<black>♣</black>","<red>♠</red>","<black>♦</black>","<red>♥</red>" }

		local Identity = vRP.Identity(Passport)
		local Players = vRPC.ClosestPeds(source,5)
		for _,v in pairs(Players) do
			async(function()
				TriggerClientEvent("chat:ClientMessage",v,Identity["name"].." "..Identity["name2"],"Tirou "..cards[card]..naipes[naipe].." do baralho.")
			end)
		end
	end,

	["soap"] = function(source,Passport,Amount,Slot,Full,Item,Split)
		if vPLAYER.checkSoap(source) ~= nil then
			Active[Passport] = os.time() + 10
			Player(source)["state"]["Buttons"] = true
			TriggerClientEvent("inventory:Close",source)
			TriggerClientEvent("Progress",source,"Usando",10000)
			vRPC.playAnim(source,false,{"amb@world_human_bum_wash@male@high@base","base"},true)

			repeat
				if os.time() >= parseInt(Active[Passport]) then
					Active[Passport] = nil
					vRPC.Destroy(source)
					Player(source)["state"]["Buttons"] = false

					if vRP.TakeItem(Passport,Full,1,true,Slot) then
						TriggerClientEvent("player:Residuals",source)
					end
				end

				Wait(100)
			until not Active[Passport]
		end
	end
}