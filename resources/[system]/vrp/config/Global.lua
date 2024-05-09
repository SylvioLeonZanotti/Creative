-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
UsableF7 = true
Whitelisted = true
CombatLogMinutes = 3
SalarySeconds = 1800
BannedText = "Você Está Banido da Cidade - - https://discord.gg/3MytTDF6zx "
CleanDeathInventory = true
ServerName = "TERRA NOVA RP"
ReleaseText = "Envie seu ID na sala liberação la no Discord - https://discord.gg/3MytTDF6zx Seu ID: "
SpawnCoords = vec3(-27.62,-145.58,56.99)
BackPrison = vec3(1894.91,2604.28,45.75)
BackpackWeightDefault = 25
WipeBackpackDeath = false
NewItemIdentity = true
-----------------------------------------------------------------------------------------------------------------------------------------
-- BASE
-----------------------------------------------------------------------------------------------------------------------------------------
BaseMode = "steam"
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUNGER / THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
ConsumeHunger = 2
ConsumeThirst = 2
CooldownHungerThrist = 120000
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAINTENANCE
-----------------------------------------------------------------------------------------------------------------------------------------
Maintenance = false
MaintenanceText = "Servidor em manutenção"
MaintenanceLicenses = {
	[""] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARACTERITENS
-----------------------------------------------------------------------------------------------------------------------------------------
CharacterItens = {
	["water"] = 3,
	["sandwich"] = 5,
	["cellphone"] = 1,
	["dollars"] = 5000
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
GroupBlips = {
	["Police"] = true,
	["Mechanic"] = true,
	["Paramedic"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLIENTSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
ClientState = {
	["Police"] = true,
	["Mechanic"] = true,
	["Paramedic"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTCLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
StartClothes = {
	["mp_m_freemode_01"] = {
		["pants"] = { item = 0, texture = 0 },
		["arms"] = { item = 0, texture = 0 },
		["tshirt"] = { item = 1, texture = 0 },
		["torso"] = { item = 0, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["shoes"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["hat"] = { item = -1, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 }
	},
	["mp_f_freemode_01"] = {
		["pants"] = { item = 0, texture = 0 },
		["arms"] = { item = 0, texture = 0 },
		["tshirt"] = { item = 1, texture = 0 },
		["torso"] = { item = 0, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["shoes"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["hat"] = { item = -1, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["decals"] = { item = 0, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LANG
-----------------------------------------------------------------------------------------------------------------------------------------
Lang = {
	["Join"] = "Entrando em Kaduzera Network...",
	["Connecting"] = "Conectando em Kaduzera Network...",
	["Position"] = "Você é o %d/%d da fila, aguarde sua conexão com a Kaduzera Network",
	["Error"] = "Conexão perdida com a Kaduzera Network."
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUEUE
-----------------------------------------------------------------------------------------------------------------------------------------
Queue = {
	["List"] = {},
	["Players"] = {},
	["Counts"] = 0,
	["Connecting"] = {},
	["Threads"] = 0,
	["Max"] = 2048
}