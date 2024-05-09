-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("crafting", Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Wanted(Passport,source) and exports["hud"]:Reposed(Passport) then
			return false
		end
	end

	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Permission(Type)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        if List[Type]["perm"] then
            if List[Type]["perm"] ~= nil then
                if vRP.HasGroup(Passport,List[Type]["perm"],1) then
                    return true
                end
            end
        else
            return true
        end
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Request(Type)
    local source = source
    local Passport = vRP.Passport(source)
    if Passport then
        local inventoryShop = {}
        for Item, v in pairs(List[Type]["List"]) do
            local keyList = {}

            for Required, Amount in pairs(v.require) do
                keyList[#keyList + 1] = { index = Required, amount = Amount }
            end

            inventoryShop[#inventoryShop + 1] = {
                ["id"] = Type,
                ["name"] = itemName(Item),
                ["index"] = itemIndex(Item),
                ["type"] = itemType(Item),
                ["economy"] = parseFormat(itemEconomy(Item)),
                ["key"] = Item,
                ["weight"] = itemWeight(Item),
                ["amount"] = parseInt(v["amount"]),
                ["recipeItems"] = keyList,
                ["craftable"] = v["craftable"],
                ["time"] = v["time"]
            }
        end

        local InventoryUser = {}
		local Inventory = vRP.Inventory(Passport)
        for Index, v in pairs(Inventory) do
            v["amount"] = parseInt(v.amount)
            v["name"] = itemName(v["item"])
            v["weight"] = itemWeight(v["item"])
            v["index"] = itemIndex(v["item"])
            v["max"] = itemMaxAmount(v["item"])
            v["economy"] = parseFormat(itemEconomy(v["item"]))
            v["key"] = v["item"]
            v["slot"] = Index

            local SplitString = splitString(v["item"], "-")
            if SplitString[2] ~= nil then
                if itemDurability(v.item) then
                    v["durability"] = parseInt(os.time() - SplitString[2])
                    v["days"] = itemDurability(v["item"])
                else
                    v["durability"] = 0
                    v["days"] = 1
                end
            else
                v["durability"] = 0
                v["days"] = 1
            end
            InventoryUser[Index] = v
        end
        return inventoryShop, InventoryUser, vRP.InventoryWeight(Passport), vRP.GetWeight(Passport)
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Crafting(Type, Item, Amount)
    local source = source
    local Amount = parseInt(Amount)
    local Passport = vRP.Passport(source)
    if Passport then
        if Amount <= 0 then Amount = 1 end

        if List[Type]["List"][Item] then
            if vRP.MaxItens(Passport, Item, List[Type]["List"][Item]["amount"] * Amount) then
                TriggerClientEvent("Notify", source, "amarelo", "Limite atingido.", "Atenção", 5000)
                TriggerClientEvent("crafting:Update", source, "requestCrafting")
                return
            end

            if (vRP.InventoryWeight(Passport) + (itemWeight(Item) * List[Type]["List"][Item]["amount"]) * Amount) <= vRP.GetWeight(Passport) then
                for Index, v in pairs(List[Type]["List"][Item]["require"]) do
                    local ConsultItem = vRP.InventoryItemAmount(Passport, Index)
                    if ConsultItem[1] < parseInt(v * Amount) then
                        return
                    end

                    if vRP.CheckDamaged(ConsultItem[2]) then
                        TriggerClientEvent("Notify", source, "vermelho", "Item danificado.",5000)
                        return
                    end
                end

                for Index, v in pairs(List[Type]["List"][Item]["require"]) do
                    local ConsultItem = vRP.InventoryItemAmount(Passport, Index)
                    vRP.RemoveItem(Passport, ConsultItem[2], parseInt(v * Amount),true)
                end

                vRP.GenerateItem(Passport, Item, List[Type]["List"][Item]["amount"] * Amount, true)
            else
                TriggerClientEvent("Notify", source, "vermelho", "Mochila cheia.", 5000)
            end
        end

        TriggerClientEvent("crafting:Update", source, "requestCrafting")
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OWNED
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Owned(Liste, Item)
    local Owned = {}
    local source = source
    local Passport = vRP.Passport(source)

    if Passport and List[Liste]["List"][Item] then
        for Iten, v in pairs(List[Liste]["List"][Item]["require"]) do
            table.insert(Owned, {
                ["index"] = Iten,
                ["amount"] = vRP.ItemAmount(Passport, Iten)
            })
        end

        return Owned
    end

    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.functionDestroy(Item, Type, Amount, Slot)
    local source = source
    local Amount = parseInt(Amount)
    local Passport = vRP.Passport(source)
    if Passport then
        if Amount <= 0 then Amount = 1 end

        local SplitString = splitString(Item, "-")
        if List[Type]["List"][SplitString[1]] and List[Type]["List"][SplitString[1]]["destroy"] then
            if vRP.CheckDamaged(Item) then
                TriggerClientEvent("Notify", source, "vermelho", "Item danificado.", 5000)
                TriggerClientEvent("crafting:Update", source, "requestCrafting")
                return
            end

            if vRP.TakeItem(Passport, Item, List[Type]["List"][SplitString[1]]["amount"], Slot,true) then
                for Index, v in pairs(List[Type]["List"][SplitString[1]]["require"]) do
                    if parseInt(v) <= 1 then
                        vRP.GenerateItem(Passport, Index, 1)
                    else
                        vRP.GenerateItem(Passport, Index, v / 2)
                    end
                end
            end
        end

        TriggerClientEvent("crafting:Update", source, "requestCrafting")
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("crafting:populateSlot")
AddEventHandler("crafting:populateSlot", function(Item, Slot, Target, Amount)
    local source = source
    local Amount = parseInt(Amount)
    local Passport = vRP.Passport(source)
    if Passport then
        if Amount <= 0 then Amount = 1 end

        if vRP.TakeItem(Passport, Item, Amount, false, Slot) then
            vRP.GiveItem(Passport, Item, Amount, false, Target)
            TriggerClientEvent("crafting:Update", source, "requestCrafting")
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("crafting:updateSlot")
AddEventHandler("crafting:updateSlot", function(Item, Slot, Target, Amount)
    local source = source
    local Amount = parseInt(Amount)
    local Passport = vRP.Passport(source)
    if Passport then
        if Amount <= 0 then Amount = 1 end

        local Inventory = vRP.Inventory(Passport)
        if Inventory[tostring(Slot)] then
            if Inventory[tostring(Target)] and Inventory[tostring(Slot)]["item"] == Inventory[tostring(Target)]["item"] then
                if vRP.TakeItem(Passport, Item, Amount, false, Slot) then
                    vRP.GiveItem(Passport, Item, Amount, false, Target)
                end
            end
        else
            vRP.SwapSlot(Passport, Slot, Target)
        end

        TriggerClientEvent("crafting:Update", source, "requestCrafting")
    end
end)