fx_version "bodacious"
game "gta5"
lua54 "yes"

client_scripts {
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

server_scripts {
	"@vrp/lib/Utils.lua",
	"server-side/*"
}

shared_scripts {
	"shared-side/*"
}