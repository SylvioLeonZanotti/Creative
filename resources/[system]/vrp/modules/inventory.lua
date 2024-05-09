-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local srvData = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ConsultItem(Passport,Item,Amount)
    if vRP.Source(Passport) then
        if Amount > vRP.InventoryItemAmount(Passport,Item)[1] then
            return false
        elseif vRP.CheckDamaged(vRP.InventoryItemAmount(Passport,Item)[1]) then
            return false
        end
    end
    return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetWeight(Passport)
    local Source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Source and Datatable then
        if not Datatable["Weight"] then
            Datatable["Weight"] = BackpackWeightDefault
        end
        return Datatable["Weight"]
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetWeight(Passport,Amount)
    local Source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Source and Datatable then
        if not Datatable["Weight"] then
            Datatable["Weight"] = BackpackWeightDefault
        end
        Datatable["Weight"] = Datatable["Weight"] + Amount
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemoveWeight(Passport,Amount)
    local Source = vRP.Source(Passport)
    local Datatable = vRP.Datatable(Passport)
    if Source and Datatable then
        if not Datatable["Weight"] then
            Datatable["Weight"] = BackpackWeightDefault
        end
        Datatable["Weight"] = Datatable["Weight"] - Amount
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWAPSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SwapSlot(Passport,Slot,Target)
    local source = vRP.Source(Passport)
    local Inventory = vRP.Inventory(Passport)
    Slot = tostring(Slot)
    Target = tostring(Target)
    if source and Inventory then
        Inventory[Target], Inventory[Slot] = Inventory[Slot], Inventory[Target]
        if parseInt(Target) <= 5 then
            if parseInt(Slot) > 5 then
                if "Armamento" == itemType(Inventory[Target]["item"]) then
                    TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Target]["item"])
                end
                if "Armamento" == itemType(Inventory[Slot]["item"]) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Inventory[Slot]["item"])
                end
            end
        elseif parseInt(Slot) <= 5 and parseInt(Target) > 5 and "Armamento" == itemType(Inventory[Slot]["item"]) then
            TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
            if "Armamento" == itemType(Inventory[Target]["item"]) then
                TriggerClientEvent("inventory:CreateWeapon",source,Inventory[Target]["item"])
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InventoryWeight(Passport)
    local Weight = 0
    local source = vRP.Source(Passport)
    if source then
        local Inventory = vRP.Inventory(Passport)
        for k,v in pairs(Inventory) do
            Weight = Weight + itemWeight(v["item"]) * v["amount"]
        end
    end
    return Weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKDAMAGED
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.CheckDamaged(Item)
    if itemDurability(Item) and splitString(Item, "-")[2] and parseInt((86400 * itemDurability(Item) - parseInt(os.time() - splitString(Item, "-")[2])) / (86400 * itemDurability(Item)) * 100) <= 1 then
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ChestWeight(items)
    local weight = 0
    for k, v in pairs(items) do
        weight = weight + (itemWeight(v["item"]) * v["amount"])
    end
    return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InventoryItemAmount(Passport, Item)
    if vRP.Source(Passport) then
        local Inventory = vRP.Inventory(Passport)
        for k, v in pairs(Inventory) do
            if splitString(Item, "-")[1] == splitString(v["item"], "-")[1] then
                return { v["amount"], v["item"] }
            end
        end
    end
    
    return { 0,"" }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYFULL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.InventoryFull(Passport, Item)
    if vRP.Source(Passport) then
        local Inventory = vRP.Inventory(Passport)
        for k,v in pairs(Inventory) do
            if v["item"] == Item then
                return true
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.ItemAmount(Passport,Item)
    if vRP.Source(Passport) then
        local Inventory = vRP.Inventory(Passport)
        for k,v in pairs(Inventory) do
            if splitString(v["item"], "-")[1] == splitString(Item, "-")[1] then
                return v["amount"]
            end
        end
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GiveItem(Passport,Item,Amount,Notify,Slot)
    local source = vRP.Source(Passport)
    TriggerClientEvent("inventory:Update",source,"Backpack")
    if source and parseInt(Amount) > 0 then
        local Inventory = vRP.Inventory(Passport)
        if not Slot then
            local newSlot = 0
            repeat
                newSlot = newSlot + 1
            until Inventory[tostring(newSlot)] == nil or Inventory[tostring(newSlot)] and Inventory[tostring(newSlot)]["item"] == Item
            if not Inventory[tostring(newSlot)] then
                Inventory[tostring(newSlot)] = { amount = parseInt(Amount), item = Item }
                if parseInt(tostring(newSlot)) <= 5 and "Armamento" == itemType(Item) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Item)
                end
            elseif Inventory[tostring(newSlot)] and Inventory[tostring(newSlot)]["item"] == Item then
                Inventory[tostring(newSlot)]["amount"] = Inventory[tostring(newSlot)]["amount"] + parseInt(Amount)
            end
            if Notify and itemBody(Item) then
                TriggerClientEvent("itensNotify",source,{ "+",itemIndex(Item),parseFormat(Amount),itemName(Item) })
            end
        else
            Slot = tostring(Slot)
            if Inventory[Slot] then
                if Inventory[Slot]["item"] == Item then
                    Inventory[Slot]["amount"] = Inventory[Slot]["amount"] + parseInt(Amount)
                end
            else
                Inventory[Slot] = { amount =  parseInt(Amount), item = Item }
                if parseInt(Slot) <= 5 and "Armamento" == itemType(Item) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Item)
                end
            end
            if Notify and itemBody(Item) then
                TriggerClientEvent("itensNotify",source,{ "+", itemIndex(Item),parseFormat(Amount),itemName(Item) })
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GenerateItem(Passport,Item,Amount,Notify,Slot)
    local source = vRP.Source(Passport)
    if source and parseInt(Amount) > 0 then
        local Inventory = vRP.Inventory(Passport)
        if itemDurability(Item) then
            Item = Item .."-"..os.time()
        elseif itemCharges(Item) then
            Item = Item .."-"..itemCharges(Item)
        end
        if not Slot then
            local newSlot = 0
            repeat
                newSlot = newSlot + 1
            until Inventory[tostring(newSlot)] == nil or Inventory[tostring(newSlot)] and Inventory[tostring(newSlot)]["item"] == Item
            
            if not Inventory[tostring(newSlot)] then
                Inventory[tostring(newSlot)] = { amount = parseInt(Amount), item = Item }
                if parseInt(tostring(i)) <= 5 and "Armamento" == itemType(Item) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Item)
                end
            elseif Inventory[tostring(newSlot)] and Inventory[tostring(newSlot)]["item"] == Item then
                Inventory[tostring(newSlot)]["amount"] = Inventory[tostring(newSlot)]["amount"] + parseInt(Amount)
            end
            if Notify and itemBody(Item) then
                TriggerClientEvent("itensNotify",source,{ "recebeu",itemIndex(Item),parseFormat(Amount),itemName(Item) })
            end
        else
            Slot = tostring(Slot)
            if Inventory[Slot] then
                if Inventory[Slot]["item"] == Item then
                    Inventory[Slot]["amount"] = Inventory[Slot]["amount"] + parseInt(Amount)
                end
            else
                Inventory[Slot] = { amount = parseInt(Amount), item = Item }
                if parseInt(Slot) <= 5 and "Armamento" == itemType(Item) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Item)
                end
            end
            if Notify and itemBody(Item) then
                TriggerClientEvent("itensNotify",source,{ "recebeu",itemIndex(Item),parseFormat(Amount),itemName(Item) })
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAXITENS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.MaxItens(Passport,Item,Amount)
    if itemBody(Item) and vRP.Source(Passport) and itemMaxAmount(Item) then
        if vRP.HasService(Passport,"Restaurants") then
            if itemScape(Item) and vRP.ItemAmount(Passport,Item) + parseInt(Amount) > itemMaxAmount(Item) * 5 then
                return true
            end
        elseif vRP.ItemAmount(Passport,Item) + parseInt(Amount) > itemMaxAmount(Item) then
            return true
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.TakeItem(Passport,Item,Amount,Notify,Slot)
    local source = vRP.Source(Passport)
    local take = false
    if source and parseInt(Amount) > 0 then
        local Inventory = vRP.Inventory(Passport)
        if not Slot then
            for k,v in pairs(Inventory) do
                if v["item"] == Item and parseInt(Amount) <= v["amount"] then
                    v["amount"] = v["amount"] - parseInt(Amount)
                    if v["amount"] <= 0 then
                        if "Armamento" == itemType(Item) or "Throwing" ~= itemType(Item) then
                            TriggerClientEvent("inventory:verifyWeapon",source,Item)
                        end
                        if parseInt(k) <= 5 then
                            TriggerClientEvent("inventory:RemoveWeapon",source,Item)
                        end
                        Inventory[k] = nil
                    end
                    if Notify and itemBody(Item) then
                        TriggerClientEvent("itensNotify",source, { "removeu",itemIndex(Item),parseFormat(Amount),itemName(Item) })
                    end
                    take = true
                    break
                end
            end
        elseif Inventory[tostring(Slot)]["item"] == Item and parseInt(Amount) <= Inventory[tostring(Slot)]["amount"] then
            Inventory[tostring(Slot)]["amount"] =  Inventory[tostring(Slot)]["amount"] - parseInt(Amount)
            if  Inventory[tostring(Slot)]["amount"] <= 0 then
                if "Armamento" == itemType(Item) or "Throwing" ~= itemType(Item) then
                    TriggerClientEvent("inventory:verifyWeapon",source,Item)
                end
                if parseInt(Slot) <= 5 then
                    TriggerClientEvent("inventory:RemoveWeapon",source,Item)
                end
                Inventory[tostring(Slot)] = nil
            end
            if Notify and itemBody(Item) then
                TriggerClientEvent("itensNotify",source,{ "removeu",itemIndex(Item),parseFormat(Amount),itemName(Item) })
            end
            take = true
        end
    end
    return take
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemoveItem(Passport,Item,Amount,Notify)
    local source = vRP.Source(Passport)
    if source and parseInt(Amount) > 0 then
        local Inventory = vRP.Inventory(Passport)
        for k, v in pairs(Inventory) do
            if v["item"] == Item and parseInt(Amount) <= v["amount"] then
                v["amount"] = v["amount"] - parseInt(Amount)
                if v["amount"] <= 0 then
                    if "Armamento" == itemType(Item) or "Throwing" ~= itemType(Item) then
                    end
                    TriggerClientEvent("inventory:verifyWeapon",source,Item)
                    if parseInt(k) <= 5 then
                        TriggerClientEvent("inventory:RemoveWeapon",source,Item)
                    end
                    Inventory[k] = nil
                end
                if Notify and itemBody(Item) then
                    TriggerClientEvent("itensNotify",source,{ "removeu",itemIndex(Item),parseFormat(Amount),itemName(Item) })
                end
                break
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSRVDATA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetSrvData(Key)
	if srvData[Key] == nil then
		local rows = vRP.Query("entitydata/GetData",{ dkey = Key })
		if parseInt(#rows) > 0 then
			srvData[Key] = { data = json.decode(rows[1]["dvalue"]), timer = 180 }
		else
			srvData[Key] = { data = {}, timer = 180 }
		end
	end

	return srvData[Key]["data"]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETSRVDATA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.SetSrvData(Key,Data)
	srvData[Key] = { data = Data, timer = 180 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMSRVDATA
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemSrvData(Key)
	srvData[Key] = { data = {}, timer = 180 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SRVSYNC
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		for k,v in pairs(srvData) do
			if v["timer"] > 0 then
				v["timer"] = v["timer"] - 1

				if v["timer"] <= 0 then
					vRP.Query("entitydata/SetData",{ dkey = k, dvalue = json.encode(v["data"]) })
					srvData[k] = nil
				end
			end
		end

		Wait(60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SAVESERVER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("SaveServer")
AddEventHandler("SaveServer",function(Silenced)
	for k,v in pairs(srvData) do
		if json.encode(v["data"]) == "[]" or json.encode(v["data"]) == "{}" then
			vRP.Query("entitydata/RemoveData",{ dkey = k })
		else
			vRP.Query("entitydata/SetData",{ dkey = k, dvalue = json.encode(v["data"]) })
		end
	end

	if not Silenced then
		print("Powered by Kaduzinho#0001")
		print("Save no banco de dados terminou, ja pode reiniciar o servidor.")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKECHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.TakeChest(Passport,Data,Amount,Slot,Target)
    local source = vRP.Source(Passport)
    local Datatable = vRP.GetSrvData(Data)
    Slot = tostring(Slot)
    Target = tostring(Target)
    if source and parseInt(Amount) > 0 and Datatable[Slot] then
        local Inventory = vRP.Inventory(Passport)
        if vRP.MaxItens(Passport, Datatable[Slot]["item"], (parseInt(Amount))) then
            TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
            return true
        end
        if vRP.InventoryWeight(Passport) + itemWeight(Datatable[Slot]["item"]) * parseInt(Amount) <= vRP.GetWeight(Passport) then
            if Inventory[Target] then
                if Datatable[Slot] and Inventory[Target]["item"] == Datatable[Slot]["item"] and parseInt(Amount) <= Datatable[Slot]["amount"] then
                    Inventory[Target]["amount"] = Inventory[Target]["amount"] + parseInt(Amount)
                    Datatable[Slot]["amount"] = Datatable[Slot]["amount"] - parseInt(Amount)
                    if 0 >= Datatable[Slot]["amount"] then
                        Datatable[Slot] = nil
                    end
                end
            elseif Datatable[Slot] and parseInt(Amount) <= Datatable[Slot]["amount"] then
                Inventory[Target] = { amount = parseInt(Amount), item = Datatable[Slot]["item"]}
                Datatable[Slot]["amount"] = Datatable[Slot]["amount"] - parseInt(Amount)
                if parseInt(Target) <= 5 and "Armamento" == itemType(Datatable[Slot]["item"]) then
                    TriggerClientEvent("inventory:CreateWeapon",source,Datatable[Slot]["item"])
                end
                if 0 >= Datatable[Slot]["amount"] then
                    Datatable[Slot] = nil
                end
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORECHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.StoreChest(Passport,Data,Amount,Weight,Slot,Target)
    local Inventory = vRP.Inventory(Passport)
    local Datatable = vRP.GetSrvData(Data)
    local source = vRP.Source(Passport)
    Slot = tostring(Slot)
    Target = tostring(Target)
    if source and parseInt(Amount) > 0 and Inventory[Slot] and Weight >= vRP.ChestWeight(Datatable) + itemWeight(Inventory[Slot]["item"]) * parseInt(Amount) then
        if Datatable[Target] then
            if Inventory[Slot] then
                if Inventory[Slot]["item"] ~= Datatable[Target]["item"] then
                    return
                end
                if not (parseInt(Amount) <= Inventory[Slot]["amount"]) then
                    return
                end
                Datatable[Target]["amount"] = Datatable[Target]["amount"] + parseInt(Amount)
                Inventory[Slot]["amount"] = Inventory[Slot]["amount"] - parseInt(Amount)
                if 0 >= Inventory[Slot]["amount"] then
                    if "Armamento" == itemType(Inventory[Slot]["item"]) or "Throwing" ~= itemType(Inventory[Slot]["item"]) then
                        TriggerClientEvent("inventory:verifyWeapon",source,Inventory[Slot]["item"])
                        if parseInt(Slot) <= 5 then
                            TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
                        end
                    end
                    Inventory[Slot] = nil
                end
            end
        elseif Inventory[Slot] and parseInt(Amount) <= Inventory[Slot]["amount"] then
            Datatable[Target] = { amount = parseInt(Amount), item = Inventory[Slot]["item"] }
            Inventory[Slot]["amount"] = Inventory[Slot]["amount"] - parseInt(Amount)
            if 0 >= Inventory[Slot]["amount"] then
                if "Armamento" == itemType(Inventory[Slot]["item"]) or "Throwing" ~= itemType(Inventory[Slot]["item"]) then
                    TriggerClientEvent("inventory:verifyWeapon",source,Inventory[Slot]["item"])
                    if parseInt(Slot) <= 5 then
                        TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
                    end
                end
                Inventory[Slot] = nil
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.UpdateChest(Passport,Data,Slot,Target,Amount)
    local Datatable = vRP.GetSrvData(Data)
    Slot = tostring(Slot)
    Target = tostring(Target)
    if vRP.Source(Passport) and parseInt(Amount) > 0 and Datatable[Slot] then
        if Datatable[Target] then
            if Datatable[Slot] then
                if Datatable[Slot]["item"] == Datatable[Target]["item"] then
                    if parseInt(Amount) <= Datatable[Slot]["amount"] then
                        Datatable[Slot]["amount"] = Datatable[Slot]["amount"] - parseInt(Amount)
                        if 0 >= Datatable[Slot]["amount"] then
                            Datatable[Slot] = nil
                        end
                        Datatable[Target]["amount"] = Datatable[Target]["amount"] + parseInt(Amount)
                    end
                else
                    Datatable[Target], Datatable[Slot] = Datatable[Slot], Datatable[Target]
                end
            end
        elseif Datatable[Slot] and parseInt(Amount) <= Datatable[Slot]["amount"] then
            Datatable[Slot]["amount"] = Datatable[Slot]["amount"] - parseInt(Amount)
            Datatable[Target] = { item = Datatable[Slot]["item"], amount = parseInt(Amount) }
            if 0 >= Datatable[Slot]["amount"] then
                Datatable[Slot] = nil
            end
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIRECTCHEST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.DirectChest(Chest,Slot,Amount)
    local Datatable = vRP.GetSrvData("Chest:"..Chest)
    if Datatable[Slot] then
        if "dollars" == Datatable[Slot]["item"] then
            Datatable[Slot]["amount"] = Datatable[Slot]["amount"] + parseInt(Amount)
        else
            Datatable[Slot] = { item = "dollars", amount = parseInt(Amount) }
        end
    else
        Datatable[Slot] = { item = "dollars", amount = parseInt(Amount) }, parseInt(Amount)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORYITEMUPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function tvRP.invUpdate(Slot,Target,Amount)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport and parseInt(Amount) > 0 then
        local Inventory = vRP.Inventory(Passport)
        Slot = tostring(Slot)
        Target = tostring(Target)
        if Inventory[Slot] then
            if Inventory[Target] then
                if Inventory[Slot]["item"] == Inventory[Target]["item"] then
                    if parseInt(Amount) <= Inventory[Slot]["amount"] then
                        Inventory[Slot]["amount"] = Inventory[Slot]["amount"] - parseInt(Amount)
                        Inventory[Target]["amount"] = Inventory[Target]["amount"] + parseInt(Amount)
                        if Inventory[Slot]["amount"] <= 0 then
                            if parseInt(Slot) <= 5 and "Armamento" == itemType(Inventory[Slot]["item"]) then
                                TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
                            end
                            Inventory[Slot] = nil
                        end
                    end
                else
                    if Inventory[Slot]["item"] and Inventory[Target]["item"] then
                        if Inventory[Slot]["item"] == "dollars" and "suitcase" == splitString(Inventory[Target]["item"], "-")[1] then 
                            if vRP.TakeItem(Passport, "dollars", parseInt(Amount), false, Slot) then
                                if splitString(Inventory[Target]["item"], "-")[2] then
                                    Inventory[Target]["item"] = "suitcase-"..splitString(Inventory[Target]["item"], "-")[2] + parseInt(Amount)
                                    TriggerClientEvent("inventory:Update",source,"Backpack")
                                else
                                    Inventory[Target]["item"] = "suitcase-"..parseInt(Amount)
                                    TriggerClientEvent("inventory:Update",source,"Backpack")
                                end
                            end
                        elseif Inventory[Slot]["item"] == "repairkit0"..string.sub(Inventory[Slot]["item"],11,12) then
                            if vRP.CheckDamaged(Inventory[Target]["item"]) and 1 == Inventory[Target]["amount"] then
                                if Inventory[Slot]["item"] == "repairkit0"..string.sub(Inventory[Slot]["item"],11,12) then
                                    if itemRepair(Inventory[Target]["item"]) then
                                        if itemRepair(Inventory[Target]["item"]) == Inventory[Slot]["item"] then
                                            if vRP.TakeItem(Passport, Inventory[Slot]["item"], 1, false, Slot) then
                                                Inventory[Target]["item"] = splitString(Inventory[Target]["item"], "-")[1] .."-"..os.time()
                                                TriggerClientEvent("Notify",source,"verde","Reparado.",5000)
                                            end
                                        else
                                            TriggerClientEvent("Notify",source,"amarelo","Seu item pode ser reparado com <b>"..itemName((itemRepair(Inventory[Target]["item"]))).."</b>.",5000)
                                        end
                                    end
                                end
                            end
                        else
                            Inventory[Target], Inventory[Slot] = Inventory[Slot], Inventory[Target]
                            if parseInt(Target) <= 5 then
                                if parseInt(Slot) > 5 then
                                    if "Armamento" == itemType(Inventory[Target]["item"]) then
                                        TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Target]["item"])
                                    end
                                    if "Armamento" == itemType(Inventory[Slot]["item"]) then
                                        TriggerClientEvent("inventory:CreateWeapon",source,Inventory[Slot]["item"])
                                    end
                                end
                            elseif parseInt(Slot) <= 5 and parseInt(Target) > 5 then
                                if "Armamento" == itemType(Inventory[Slot]["item"]) then
                                    TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
                                end
                                if "Armamento" == itemType(Inventory[Target]["item"]) then
                                    TriggerClientEvent("inventory:CreateWeapon",source,Inventory[Target]["item"])
                                end
                            end
                        end
                    end
                end
            elseif Inventory[Slot] and parseInt(Amount) <= Inventory[Slot]["amount"] then
                Inventory[Target] = { item = Inventory[Slot]["item"], amount = parseInt(Amount) }
                Inventory[Slot]["amount"] = Inventory[Slot]["amount"] - parseInt(Amount)
                if Inventory[Slot]["amount"] <= 0 then
                    if parseInt(Slot) <= 5 and parseInt(Target) > 5 and "Armamento" == itemType(Inventory[Slot]["item"]) then
                        TriggerClientEvent("inventory:RemoveWeapon",source,Inventory[Slot]["item"])
                    end
                    if parseInt(Target) <= 5 and parseInt(Slot) > 5 and "Armamento" == itemType(Inventory[Slot]["item"]) then
                        TriggerClientEvent("inventory:CreateWeapon",source,Inventory[Slot]["item"])
                    end
                    Inventory[Slot] = nil
                end
            end
        else
            TriggerClientEvent("inventory:Update",source,"Backpack")
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESOURCESTART
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("onResourceStart",function(Resource)
    if "vrp" == Resource then
        Wait(3000)
    end
end)