-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GiveBank(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        vRP.Query("characters/addBank",{ Passport = Passport, amount = Amount })
        exports["bank"]:AddTransactions(Passport,"entry",Amount)

        local Source = vRP.Source(Passport)
        if Source then
            TriggerClientEvent("itensNotify",Source,{ "+","dollars",parseFormat(Amount),"Dólares" })
        end

        if Characters[Source] then
            Characters[Source]["bank"] = Characters[Source]["bank"] + Amount
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemoveBank(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        vRP.Query("characters/remBank",{ Passport = Passport, amount = Amount })
        exports["bank"]:AddTransactions(Passport,"exit",Amount)

        local Source = vRP.Source(Passport)
        if Source then
            TriggerClientEvent("itensNotify",Source,{ "+","dollars",parseFormat(Amount),"Dólares" })
        end

        if Characters[Source] then
            Characters[Source]["bank"] = Characters[Source]["bank"] - Amount
            if 0 > Characters[Source]["bank"] then
                Characters[Source]["bank"] = 0
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetBank(source)
    if Characters[source] then
        return Characters[source]["bank"]
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETFINE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GetFine(source)
    if Characters[source] then
        return Characters[source]["fines"]
    end
    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEFINE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.GiveFine(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        vRP.Query("characters/addFines",{ id = Passport, fines = Amount })
        if Characters[Source] then
            Characters[Source]["fines"] = Characters[Source]["fines"] + Amount
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEFINE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.RemoveFine(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 then
        vRP.Query("characters/removeFines",{ id = Passport, fines = Amount })
        if Characters[Source] then
            Characters[Source]["fines"] = Characters[Source]["fines"] - Amount
            if 0 > Characters[Source]["fines"] then
                Characters[Source]["fines"] = 0
            end
        end
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTGEMS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentGems(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= vRP.UserGemstone(Characters[Source]["license"]) then
        vRP.Query("accounts/RemoveGems", { license = Characters[Source]["license"], gems = Amount })
        TriggerClientEvent("hud:RemoveGems", Source, Amount)
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentBank(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= Characters[Source]["bank"] then
        vRP.RemoveBank(Passport,Amount,(Source))
        return true
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentMoney(Passport,Amount)
	if parseInt(Amount) > 0 then
		local Amount = parseInt(Amount)
		local Passport = parseInt(Passport)
		if vRP.ConsultItem(Passport,"dollars",Amount) then
            vRP.TakeItem(Passport,"dollars",Amount,true)
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTDIRTY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentDirty(Passport,Amount)
	if parseInt(Amount) > 0 then
		local Amount = parseInt(Amount)
		local Passport = parseInt(Passport)
		if vRP.ConsultItem(Passport,"dollarsroll",Amount) then
            vRP.TakeItem(Passport,"dollarsroll",Amount,true)
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTFULL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.PaymentFull(Passport,Amount)
    if parseInt(Amount) > 0 then
        if vRP.PaymentMoney(Passport,Amount) or vRP.PaymentBank(Passport,Amount) then
            return true
        end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAWCASH
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.WithdrawCash(Passport,Amount)
    local Amount = parseInt(Amount)
    local Source = vRP.Source(Passport)
    if Amount > 0 and Characters[Source] and Amount <= Characters[Source]["bank"] then
        vRP.GenerateItem(Passport, "dollars", Amount, true)
        vRP.RemoveBank(Passport, Amount, (Source))
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