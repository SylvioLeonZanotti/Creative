fx_version "bodacious"
game "gta5"
lua54 "yes"
version "1.6.1"
author "ImagicTheCat"
viniciux "yes"
creator "no"

client_scripts {
	"config/*",
	"lib/Utils.lua",
	"client/*"
}

server_scripts {
	"config/*",
	"lib/Utils.lua",
	"modules/vrp.lua",
	"modules/base.lua",
	"modules/drugs.lua",
	"modules/groups.lua",
	"modules/identity.lua",
	"modules/inventory.lua",
	"modules/medic.lua",
	"modules/money.lua",
	"modules/party.lua",
	"modules/rolepass.lua",
	"modules/player.lua",
	"modules/premium.lua",
	"modules/prepare.lua",
	"modules/queue.lua",
	"modules/vehicles.lua",
	"modules/salary.lua"
}

files {
	"lib/*",
	"modules/*",
	"config/*",
	"config/**/*"
}