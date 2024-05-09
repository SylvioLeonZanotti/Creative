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
Tunnel.bindInterface("routes",Kaduzera)
vCLIENT = Tunnel.getInterface("routes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WORKS
-----------------------------------------------------------------------------------------------------------------------------------------
local routes = {
	-- Contraband
	["Chiliad"] = {
		["coords"] = { 1388.83,-2088.54,52.6 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Chiliad",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "contrabandbox1"
	},
	["Families"] = {
		["coords"] = { -147.85,-1605.83,35.03 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Families",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "contrabandbox1"
	},
	["Highways"] = {
		["coords"] = { 1426.7,6327.17,23.86 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Highways",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "contrabandbox2"
	},
	["Vagos"] = {
		["coords"] = { 330.07,-2014.33,22.39 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Vagos",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "contrabandbox2"
	},
	-- Favelas
	["Barragem"] = {
		["coords"] = { 1313.29,-143.11,115.76 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Barragem",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "weaponbox"
	},
	["Farol"] = {
		["coords"] = { 3235.1,5115.63,15.82 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Farol",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "wheatflour"
	},
	["Parque"] = {
		["coords"] = { 412.67,732.1,199.45 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Parque",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "wheatflour"
	},
	["Sandy"] = {
		["coords"] = { 2137.22,3983.29,34.32 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Sandy",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "wheatflour"
	},
	["Petroleo"] = {
		["coords"] = { 1458.49,-2436.59,66.12 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Petroleo",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "ammobox2"
	},
	["Praia-1"] = {
		["coords"] = { -3098.8,1428.45,27.01 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Praia-1",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "wheatflour"
	},
	["Praia-2"] = {
		["coords"] = { -3101.81,1678.9,37.68 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Praia-2",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "wheatflour"
	},
	["Zancudo"] = {
		["coords"] = { -627.08,2204.21,126.14 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Zancudo",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 3,
			["max"] = 5
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "wheatflour"
	},
	-- Mafia
	["Madrazzo"] = {
		["coords"] = { 1393.39,1140.45,109.74 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Madrazzo",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 2000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "ammobox"
	},
	["Playboy"] = {
		["coords"] = { -1519.26,74.7,57.0 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Playboy",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "weaponbox"
	},
	["TheSouth"] = {
		["coords"] = { 984.02,-91.25,74.85 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "TheSouth",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 3000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ 264.03,-2504.0,6.44 },
			{ 766.8,-2481.74,20.17 },
			{ 939.42,-2127.42,30.62 },
			{ 1458.88,-1930.6,71.8 },
			{ 1231.64,-1083.07,38.52 },
			{ 1210.62,-448.83,66.84 },
			{ 642.3,260.3,103.29 },
			{ 232.24,365.21,106.04 },
			{ -242.04,279.66,92.03 },
			{ -719.1,256.83,79.9 },
			{ -766.31,-157.88,37.59 },
			{ -655.01,-414.25,35.47 },
			{ -773.41,-633.28,29.82 },
			{ -1004.09,-307.64,38.82 },
			{ -1253.56,-295.91,37.31 },
			{ -1484.26,-390.23,39.09 },
			{ -1388.38,-586.98,30.21 },
			{ -1190.9,-742.94,20.24 },
			{ -818.51,-1107.07,11.17 },
			{ -1191.49,-1340.36,4.94 },
			{ -1271.11,-1200.9,5.36 },
			{ -723.29,-855.27,23.0 },
			{ -582.15,-1000.61,22.33 },
			{ -296.32,-1295.82,31.26 },
			{ -115.84,-1772.65,29.82 },
			{ 222.56,-1842.68,27.11 }
		},
		["deliveryItem"] = "ammobox"
	},
	["Vineyard"] = {
		["coords"] = { -1866.22,2062.99,135.52 },
		["upgradeStress"] = 2,
		["routeCollect"] = true,
		["usingVehicle"] = false,
		["collectText"] = "COLETAR",
		["perm"] = "Vineyard",
		["collectButtonDistance"] = 1,
		["collectShowDistance"] = 50,
		["collectDuration"] = 2000,
		["collectAnim"] = { false,"amb@prop_human_parking_meter@female@idle_a","idle_a_female",true },
		["collectConsume"] = {
			["min"] = 1,
			["max"] = 2
		},
		["collectCoords"] = {
			{ -2565.73,2307.22,33.21 },
            { -1130.08,2700.32,18.8 },
            { 61.27,2793.18,57.88 },
            { 260.29,2583.2,44.82 },
            { 1041.25,2652.35,39.55 },
            { 1980.44,3049.76,50.43 },
            { 2030.26,3184.44,45.14 },
            { 2271.01,3756.89,38.42 },
            { 2440.61,4068.04,38.06 },
            { 2567.03,4651.98,34.07 },
            { 2307.31,4881.64,41.8 },
            { 2016.98,4987.82,42.09 },
            { 1647.24,4839.86,42.02 },
            { 2258.1,5165.93,59.11 },
            { 1741.39,6419.53,35.05 },
            { 174.65,6642.57,31.58 },
            { 9.51,6506.25,31.53 },
            { -428.1,6161.9,31.48 },
            { -679.64,5800.59,17.32 },
            { -1490.33,4981.44,63.36 },
            { -2173.8,4282.25,49.12 },
            { -2304.61,3427.23,31.05 },
            { -2017.85,3384.08,31.24 }
		},
		["deliveryItem"] = "weaponbox"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local collectAmount = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECTCONSUME
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.collectConsume(serviceName)
	local source = source
	local Passport = vRP.Passport(source)
	local License = vRP.Identities(source)
	local Account = vRP.Account(License)
	if Passport then
		local deliveryItem = routes[serviceName]["deliveryItem"]
		collectAmount[Passport] = math.random(routes[serviceName]["collectConsume"]["min"],routes[serviceName]["collectConsume"]["max"])

		if (vRP.InventoryWeight(Passport) + (itemWeight(deliveryItem) * parseInt(collectAmount[Passport]))) <= vRP.GetWeight(Passport) then	
			vRP.GenerateItem(Passport,deliveryItem,collectAmount[Passport],true)

			if deliveryItem == "dollars" then
				if vRP.LicensePremium(License) then
					vRP.GenerateItem(Passport,deliveryItem,collectAmount[Passport] * 0.10,true)
				end
			end

			if routes[serviceName]["upgradeStress"] > 0 then
				vRP.UpgradeStress(Passport,routes[serviceName]["upgradeStress"])
			end

			collectAmount[Passport] = nil

			return true
		else
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.checkPermission(serviceName)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if routes[serviceName]["perm"] == nil then
			return true
		end

		if vRP.HasGroup(Passport,routes[serviceName]["perm"]) then
			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Connect",function(Passport,source)
	vCLIENT.updateRoutes(source,routes)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENSURE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ensureroutes",function(source,args,rawCommand)
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerClientEvent("Notify",source,"amarelo","Script Recarregado",3000)
		if vRP.HasGroup(Passport,"Admin",1) then
			vCLIENT.updateRoutes(-1,routes)
			vCLIENT.updateRoutes(source,routes)
		end
	end
end)