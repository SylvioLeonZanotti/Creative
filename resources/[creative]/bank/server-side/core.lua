-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("bank",Kaduzera)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local yield = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- VERIFY
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Verify()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if exports["hud"]:Wanted(Passport,source) then
			return false
		end
	end

	return true
end

CreateThread(function()
	local next_time = GetGameTimer()
	while true do
	  if os.time() >= next_time then
		next_time = os.time() + 3600
		vRP.Query("investments/Actives")
	  end
	  Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HOME
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Home()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local check = vRP.Query("investments/Check", {Passport = Passport})
		if check[1] then
			yield = check[1].Monthly
		end
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
	  return {
		Passport = Passport,
		yield = yield,
		balance = balance,
		transactions = transactions,
	  }
	end
  end

  CreateThread(function()
	while true do
		Wait(1)
		Kaduzera.Home()
	end
  end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.TransactionHistory()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Transactions(Passport, 50)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANKDEPOSIT
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Deposit(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true

	    if vRP.ConsultItem(Passport, "dollars", amount) and vRP.TakeItem(Passport, "dollars",amount) then
			vRP.GiveBank(Passport, amount)
			TriggerEvent("Discord","Deposito","**ID:** "..Passport.."\n**Depositou:** "..parseInt(amount).." \n**Horário:** "..os.date("%H:%M:%S"),3092790)
		end
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)

		return {balance = balance, transactions = transactions}

	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BANWITHDRAW
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Withdraw(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true
			vRP.WithdrawCash(Passport, amount)
			TriggerEvent("Discord","Saque","**ID:** "..Passport.."\n**Sacou:** "..parseInt(amount).." \n**Horário:** "..os.date("%H:%M:%S"),3092790)
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		return {balance = balance, transactions = transactions}
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Transfer(ClosestPed,amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and Active[Passport] == nil and parseInt(amount) > 0 then
		Active[Passport] = true
			if vRP.Identity(ClosestPed) and vRP.PaymentBank(Passport, amount, true) then
				vRP.GiveBank(ClosestPed, amount)
			end
		Active[Passport] = nil
		local balance = vRP.Identity(Passport).bank
		local transactions = Transactions(Passport)
		return {balance = balance, transactions = transactions}
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSACTION
-----------------------------------------------------------------------------------------------------------------------------------------
function Transactions(Passport, Limit)
	local Passport = Passport
	local transactions = {}
	if not Limit then
		Limit = 4
	end
	local result = vRP.Query('transactions/List',{ Passport = Passport, Limit = Limit })
	if result[1] then
		for i, transaction in pairs(result) do
		    local type = transaction.Type
			local date = transaction.Date
			local value = transaction.Value
			local balance = transaction.Balance
			transactions[#transactions + 1] = {
				type = type,
				date = date,
				value = value,
				balance = balance
			}
		end
	end
	return transactions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Taxs(Passport)
	local Passport = Passport
	local taxs = {}
	local result = vRP.Query('taxs/List',{ Passport = Passport })
	if result[1] then
		for i, tax in pairs(result) do
			taxs[i] = {
				id = tax.id,
				name = tax.Name,
				value = tax.Value,
				date = tax.Date,
				hour = tax.Hour,
				message = tax.Message
			}
		end
	end
	return taxs
end

function Kaduzera.TaxList()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
	  return Taxs(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.TaxPayment(id)
	local source = source
	local Passport = vRP.Passport(source)
	local id = id
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('taxs/Check',{ Passport = Passport, id = id })
		if result[1] then
			if vRP.PaymentBank(Passport, result[1].Value) then
				vRP.Query("taxs/Remove",{ Passport = Passport, id = id })
				Active[Passport] = nil
				return true
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Invoices(Passport)
	local Passport = Passport
	local invoices = {}

	local result = vRP.Query('invoices/List',{ Passport = Passport })
	if result[1] then
		for i, invoice in pairs(result) do
			if not invoices[invoice.Type] then
				invoices[invoice.Type] = {}
			end
			local id = invoice.id
			local reason = invoice.Reason
			local holder = invoice.Holder
			invoices[invoice.Type][#invoices[invoice.Type] + 1] = {id = id, reason = reason, holder = holder, value = invoice.Value}
		end
	end
	return invoices
end
function Kaduzera.InvoiceList()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		return Invoices(Passport)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.InvoicePayment(id)
	local source = source
	local Passport = vRP.Passport(source)
	local id = id
	if Passport and Active[Passport] == nil then
		Active[Passport] = true
		local result = vRP.Query('invoices/Check',{ Passport = Passport, id = id })
		if result[1] then
			if vRP.PaymentBank(Passport, result[1].Value) then
				vRP.Query("invoices/Remove",{ Passport = Passport, id = id })
				Active[Passport] = nil
				return true
			end
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEINVOICE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.MakeInvoice(OtherPassport, value, reason)
	local source = source
	local Passport = vRP.Passport(source)
	local OtherPassport = OtherPassport
	if Passport and not Active[Passport]  and parseInt(value) > 0 then
		Active[Passport] = true
			local ClosestPed = vRP.Source(OtherPassport)
			if ClosestPed then
				if vRP.Request(ClosestPed,"Banco","<b>" .. vRP.Identity(Passport).name .. "	" .. vRP.Identity(Passport).name2 .. "</b> lhe enviou uma fatura de <b>R$" .. parseFormat(value) .. "</b>, deseja aceita-la?") then
				local Received = OtherPassport
				local Type = "received"
    			local Reason = reason
				local Holder = vRP.Identity(Passport).name .. " " .. vRP.Identity(Passport).name2
				local Value = value
				vRP.Query('invoices/Add',{ Passport = Passport,Received = Received,Type = Type,Reason = Reason,Holder = Holder ,Value = Value})
				local Type = "sent"
				local Holder = "Você"
				vRP.Query('invoices/Add',{ Passport = Passport,Received = Received,Type = Type,Reason = Reason,Holder = Holder ,Value = Value})
				return Invoices(Passport)
				end
			end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
--  INVESTMENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Investments()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local investment = vRP.Query('investments/Check',{ Passport = Passport })
		if investment[1] then
			local deposit = investment[1].Deposit
			local liquid = investment[1].Liquid
			local brute = deposit
			local total = deposit + liquid
			return {
				["deposit"] = deposit,
				["liquid"] = liquid,
				["brute"] = brute,
				["total"] = total
			}
		end
		return {
			["deposit"] = 0,
			["liquid"] = 0,
			["brute"] = 0,
			["total"] = 0
		}
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD INVESTMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.Invest(amount)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] and parseInt(amount) > 0 then
		Active[Passport] = true
		if vRP.PaymentBank(Passport, amount, true) then
			local investment = vRP.Query('investments/Check',{ Passport = Passport })
			if  investment[1] then
				local Value = amount
				vRP.Query("investments/Invest",{ Passport = Passport, Value = Value })
			else
				local Deposit = amount
				vRP.Query("investments/Add",{ Passport = Passport, Deposit = Deposit })
			end
			Active[Passport] = nil
			return true
		end
		Active[Passport] = nil
		end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM INVESTMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.InvestRescue()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and not Active[Passport] then
		Active[Passport] = true
		local investment = vRP.Query('investments/Check',{ Passport = Passport })
		if  investment[1] then
			vRP.Query("investments/Remove", {Passport = Passport})
			vRP.GiveBank(Passport, investment[1].Deposit + investment[1].Liquid)
		end
		Active[Passport] = nil
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTRANSACTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddTransactions",function(Passport,Type,amount)
	if vRP.Identity(Passport) then
	  local Passport = Passport
	  local Type = Type
	  local Date = os.date("%d/%m/%Y")
	  local Value = amount
	  local Balance = vRP.Identity(Passport).bank
	  vRP.Query("transactions/Add", {Passport = Passport,Type = Type,Date = Date,Value = Value,Balance = Balance})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTAXS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddTaxs", function(Passport, Name, Value, Message)
	if vRP.Identity(Passport) then
		local Passport = Passport
		local Name = Name
		local Date = os.date("%d/%m/%Y")
		local Hour = os.date("%H:%M")
		local Value = Value
		local Message = Message
	  vRP.Query("taxs/Add", {Passport = Passport,Name = Name,Date = Date,Hour = Hour,Value = Value,Message = Message}) 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
	if Active[Passport] then
	  Active[Passport] = nil
	end
end)
exports("Taxs", Taxs)
exports("Invoices", Invoices)
exports("Transactions", Transactions)