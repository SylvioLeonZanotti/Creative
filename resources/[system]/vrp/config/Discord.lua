-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDS
-----------------------------------------------------------------------------------------------------------------------------------------
Discords = {
	["Connect"] = "",
	["Disconnect"] = "",
	["Airport"] = "",
	["Deaths"] = "",
	["Police"] = "",
	["Paramedic"] = "",
	["Gemstone"] = "",
	["Login"] = "",
	-- Contraband
	["Chiliad"] = "",
	["Families"] = "",
	["Highways"] = "",
	["Vagos"] = "",
	-- Favelas
	["Barragem"] = "",
	["Farol"] = "",
	["Parque"] = "",
	["Sandy"] = "",
	["Petroleo"] = "",
	["Praia-1"] = "",
	["Praia-2"] = "",
	["Zancudo"] = "",
    -- Mafias
	["Madrazzo"] = "",
	["Playboy"] = "",
	["TheSouth"] = "",
	["Vineyard"] = "",
	-- LOGS ADMINS
	["Tpto"] = "",
	["Tptome"] = "",
	["Fix"] = "",
	["Blips"] = "",
	["God"] = "",
	["Ban"] = "",
	["Unban"] = "",
	["Kick"] = "",
	["Item"] = "",
	["Itemall"] = "",
	["Item2"] = "",
	["Group"] = "",
	["Ungroup"] = "",
	["Garages"] = "",
	["Clearchest"] = "",
	["Clearinv"] = "",
	-- LOGS KADUZERA
	["Prisao"] = "",
	["Multas"] = "",
	["Deposito"] = "",
	["Saque"] = "",
	["Avisopm"] = "",
	["Avisomec"] = "",
	["LojaPolicia"] = "",
	["LojaVip"] = "",
	["Helicrash"] = ""
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Discord",function(Hook,Message,Color)
	PerformHttpRequest(Discords[Hook],function(err,text,headers) end,"POST",json.encode({
		username = ServerName,
		embeds = { { color = Color, description = Message } }
	}),{ ["Content-Type"] = "application/json" })
end)