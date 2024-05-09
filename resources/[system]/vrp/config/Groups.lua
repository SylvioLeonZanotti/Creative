-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUPS
-----------------------------------------------------------------------------------------------------------------------------------------
Groups = {
    -- Groups
    ["Emergency"] = {
		["Parent"] = {
			["Police"] = true,
			["Paramedic"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
	["Restaurants"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe" },
		["Service"] = {}
	},
    -- Framework
	["Admin"] = {
		["Parent"] = {
			["Admin"] = true
		},
		["Hierarchy"] = { "Administrador","Moderador","Suporte" },
		["Service"] = {}
	},
	["Staff"] = {
		["Parent"] = {
			["Staff"] = true
		},
		["Hierarchy"] = { "Staff" },
		["Service"] = {}
	},
	["Premium"] = {
		["Parent"] = {
			["Premium"] = true
		},
		["Hierarchy"] = { "Platina","Ouro","Prata","Bronze" },
		["Salary"] = { 5000,4000,3500,2500 },
		["Service"] = {}
	},
	["Verify"] = {
		["Parent"] = {
			["Verify"] = true
		},
		["Hierarchy"] = { "Verify" },
		["Service"] = {}
	},
	["Booster"] = {
		["Parent"] = {
			["Booster"] = true
		},
		["Hierarchy"] = { "Booster" },
		["Salary"] = { 2000 },
		["Service"] = {}
	},
	["Streamer"] = {
		["Parent"] = {
			["Streamer"] = true
		},
		["Hierarchy"] = { "Streamer" },
		["Salary"] = { 2000 },
		["Service"] = {}
	},
	-- VIPS NOVOS
	["Platina"] = {
		["Parent"] = {
			["Platina"] = true
		},
		["Hierarchy"] = { "Platina" },
		["Salary"] = { 5000 },
		["Service"] = {}
	},
	["Ouro"] = {
		["Parent"] = {
			["Ouro"] = true
		},
		["Hierarchy"] = { "Ouro" },
		["Salary"] = { 4000 },
		["Service"] = {}
	},
	["Prata"] = {
		["Parent"] = {
			["Prata"] = true
		},
		["Hierarchy"] = { "Prata" },
		["Salary"] = { 3500 },
		["Service"] = {}
	},
	["Bronze"] = {
		["Parent"] = {
			["Bronze"] = true
		},
		["Hierarchy"] = { "Bronze" },
		["Salary"] = { 2500 },
		["Service"] = {}
	},
    -- Public
    ["Paramedic"] = {
		["Parent"] = {
			["Paramedic"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 4500,4250,4000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Police"] = {
		["Parent"] = {
			["Police"] = true
		},
		["Hierarchy"] = { "Chefe","Capitão","Tenente","Sargento","Corporal","Oficial","Cadete" },
		["Salary"] = { 5000,4500,4000,3500,3000,2500,2000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Mechanic"] = {
		["Parent"] = {
			["Mechanic"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 4500,3500,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
	["Bennys"] = {
		["Parent"] = {
			["Bennys"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Ottos"] = {
		["Parent"] = {
			["Ottos"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Salary"] = { 3500,3250,3000 },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Tuners"] = {
		["Parent"] = {
			["Tuners"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Restaurants
	["Pearls"] = {
		["Parent"] = {
			["Pearls"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Contraband
    ["Chiliad"] = {
		["Parent"] = {
			["Chiliad"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Families"] = {
		["Parent"] = {
			["Families"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Highways"] = {
		["Parent"] = {
			["Highways"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Vagos"] = {
		["Parent"] = {
			["Vagos"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Favelas
    ["Barragem"] = {
		["Parent"] = {
			["Barragem"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Farol"] = {
		["Parent"] = {
			["Farol"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Parque"] = {
		["Parent"] = {
			["Parque"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Sandy"] = {
		["Parent"] = {
			["Sandy"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Petroleo"] = {
		["Parent"] = {
			["Petroleo"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Praia-1"] = {
		["Parent"] = {
			["Praia-1"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Praia-2"] = {
		["Parent"] = {
			["Praia-2"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Zancudo"] = {
		["Parent"] = {
			["Zancudo"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    -- Mafias
    ["Madrazzo"] = {
		["Parent"] = {
			["Madrazzo"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Playboy"] = {
		["Parent"] = {
			["Playboy"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["TheSouth"] = {
		["Parent"] = {
			["TheSouth"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	},
    ["Vineyard"] = {
		["Parent"] = {
			["Vineyard"] = true
		},
		["Hierarchy"] = { "Chefe","Gerente","Membro" },
		["Service"] = {},
		["Type"] = "Work"
	}
}