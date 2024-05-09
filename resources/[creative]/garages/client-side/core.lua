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
Tunnel.bindInterface("garages",Kaduzera)
vSERVER = Tunnel.getInterface("garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DECOR
-----------------------------------------------------------------------------------------------------------------------------------------
DecorRegister("PlayerVehicle",3)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local Opened = "1"
local Searched = nil
local Cooldown = GetGameTimer()
local Anim = "machinic_loop_mechandplayer"
local Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local Garages = {
	-- Bikes (Framework)
	["1"] = { x = 156.44, y = -1065.79, z = 30.04,
		["1"] = { 162.3,-1069.1,29.18,70.87 }
	},
	["2"] = { x = -1221.5, y = -1436.12, z = 4.36,
		["1"] = { -1218.61,-1443.99,3.69,218.27 }
	},
	["3"] = { x = -777.44, y = 5593.64, z = 33.63,
		["1"] = { -776.98,5590.38,33.48,260.79 },
		["2"] = { -778.25,5586.74,33.48,255.12 }
	},
	["4"] = { x = 435.06, y = -647.39, z = 28.73,
		["1"] = { 430.22,-646.82,27.89,116.23 }
	},
	["5"] = { x = -896.38, y = -779.06, z = 15.91,
		["1"] = { -898.74,-779.98,15.22,113.39 }
	},
	["6"] = { x = -1668.56, y = -998.63, z = 7.38,
		["1"] = { -1670.4,-1000.79,6.77,138.9 }
	},
	["7"] = { x = 821.79, y = -786.84, z = 26.18,
		["1"] = { 824.47,-787.3,25.58,255.12 }
	},
	["8"] = { x = -1164.77, y = -896.74, z = 14.02,
		["1"] = { -1167.52,-897.2,13.33,34.02 }
	},
	["9"] = { x = 1576.12, y = 6464.71, z = 24.94,
		["1"] = { 1574.55,6462.57,24.28,161.58 }
	},
	["10"] = { x = 102.53, y = -1957.14, z = 20.74,
		["1"] = { 104.77,-1957.89,20.14,17.01 }
	},
	["11"] = { x = -161.14, y = -1628.7, z = 33.63,
		["1"] = { -162.25,-1626.75,33.65,130.4 }
	},
	["12"] = { x = 337.84, y = -2036.2, z = 21.37,
		["1"] = { 334.74,-2039.98,20.47,51.03 }
	},
	["13"] = { x = 524.05, y = -1829.38, z = 28.43,
		["1"] = { 525.55,-1831.05,27.58,141.74 }
	},
	["14"] = { x = 232.37, y = -1756.87, z = 29.0,
		["1"] = { 234.81,-1754.17,28.43,320.32 }
	},
	["15"] = { x = 143.91, y = 6653.49, z = 31.53,
		["1"] = { 139.73,6649.65,30.9,229.61 }
	},
	["16"] = { x = 1703.32, y = 4820.19, z = 41.97,
		["1"] = { 1706.85,4823.46,41.4,39.69 }
	},
	["17"] = { x = 958.53, y = 3618.86, z = 32.67,
		["1"] = { 952.0,3619.3,31.95,87.88 }
	},
	["18"] = { x = 1032.52, y = 2656.05, z = 39.55,
		["1"] = { 1030.05,2656.78,38.94,2.84 }
	},

	-- Boats (Framework)
	["19"] = { x = -1728.06, y = -1050.69, z = 1.7,
		["1"] = { -1734.05,-1057.01,0.94,133.23 }
	},
	["20"] = { x = -776.63, y = -1494.93, z = 2.29,
		["1"] = { -786.5,-1498.89,-0.57,110.56 }
	},
	["21"] = { x = -895.04, y = 5687.46, z = 3.03,
		["1"] = { -907.5,5684.52,0.76,102.05 }
	},
	["22"] = { x = 1509.64, y = 3788.7, z = 33.51,
		["1"] = { 1493.4,3797.23,29.89,50.19 }
	},

	-- Garage (Framework)
	["23"] = { x = 55.44, y = -876.17, z = 30.67,
		["1"] = { 60.44,-866.47,30.23,340.16 },
		["2"] = { 57.26,-865.35,30.25,340.16 },
		["3"] = { 54.03,-864.21,30.25,340.16 },
		["4"] = { 50.73,-863.01,30.26,340.16 },
		["5"] = { 60.52,-866.53,30.14,340.16 },
		["6"] = { 50.73,-873.28,30.11,158.75 },
		["7"] = { 47.36,-872.07,30.13,158.75 },
		["8"] = { 44.15,-870.9,30.13,158.75 }
	},
	["24"] = { x = 599.04, y = 2745.33, z = 42.04,
		["1"] = { 604.82,2738.27,41.64,187.09 },
		["2"] = { 601.75,2738.08,41.65,184.26 },
		["3"] = { 598.63,2737.85,41.69,184.26 },
		["4"] = { 595.59,2737.55,41.7,184.26 }
	},
	["25"] = { x = -136.8, y = 6356.84, z = 31.49,
		["1"] = { -133.72,6349.01,31.16,42.52 },
		["2"] = { -136.1,6346.53,31.16,42.52 }
	},
	["26"] = { x = 596.43, y = 90.68, z = 93.13,
		["1"] = { 599.82,102.03,92.57,249.45 },
		["2"] = { 598.69,98.42,92.57,249.45 }
	},
	["27"] = { x = -340.57, y = 266.04, z = 85.68,
		["1"] = { -349.47,272.54,84.77,272.13 },
		["2"] = { -349.5,275.91,84.69,272.13 },
		["3"] = { -349.56,279.3,84.62,272.13 },
		["4"] = { -349.67,282.6,84.59,274.97 },
		["5"] = { -349.74,286.16,84.59,272.13 },
		["6"] = { -349.8,289.76,84.6,272.13 },
		["7"] = { -349.85,293.28,84.6,272.13 },
		["8"] = { -349.87,296.72,84.6,272.13 }
	},
	["28"] = { x = -2030.03, y = -465.99, z = 11.59,
		["1"] = { -2037.4,-461.02,11.07,138.9 },
		["2"] = { -2039.78,-459.07,11.07,138.9 },
		["3"] = { -2042.12,-457.1,11.07,138.9 },
		["4"] = { -2044.47,-455.11,11.07,138.9 },
		["5"] = { -2046.85,-453.09,11.07,138.9 },
		["6"] = { -2049.12,-451.17,11.07,138.9 },
		["7"] = { -2051.51,-449.23,11.07,138.9 }
	},
	["29"] = { x = -1184.94, y = -1509.99, z = 4.65,
		["1"] = { -1183.29,-1495.81,4.04,121.89 },
		["2"] = { -1185.23,-1493.28,4.04,121.89 },
		["3"] = { -1186.87,-1490.71,4.04,121.89 },
		["4"] = { -1188.69,-1488.27,4.04,121.89 }
	},
	["30"] = { x = -348.89, y = -874.02, z = 31.31,
		["1"] = { -343.62,-875.51,30.75,167.25 },
		["2"] = { -339.98,-876.27,30.75,167.25 },
		["3"] = { -336.35,-876.98,30.75,167.25 },
		["4"] = { -332.72,-877.71,30.75,167.25 }
	},
	["31"] = { x = 1035.84, y = -763.87, z = 58.0,
		["1"] = { 1046.56,-774.55,57.69,90.71 },
		["2"] = { 1046.56,-778.24,57.68,90.71 },
		["3"] = { 1046.55,-782.0,57.68,90.71 },
		["4"] = { 1046.54,-785.65,57.66,90.71 }
	},
	["32"] = { x = -796.69, y = -2022.85, z = 9.17,
		["1"] = { -779.77,-2040.03,8.56,314.65 },
		["2"] = { -777.36,-2042.58,8.56,314.65 },
		["3"] = { -774.92,-2044.9,8.56,314.65 }
	},
	["33"] = { x = 453.28, y = -1146.77, z = 29.5,
		["1"] = { 467.33,-1151.89,28.96,85.04 },
		["2"] = { 467.16,-1154.75,28.96,85.04 },
		["3"] = { 467.1,-1157.73,28.96,87.88 }
	},
	["34"] = { x = -1159.56, y = -739.39, z = 19.88,
		["1"] = { -1144.95,-745.49,19.34,104.89 },
		["2"] = { -1142.76,-748.44,19.19,107.72 },
		["3"] = { -1140.18,-751.41,19.06,107.72 },
		["4"] = { -1137.99,-754.36,18.91,107.72 },
		["5"] = { -1135.43,-757.3,18.75,107.72 },
		["6"] = { -1133.12,-760.4,18.59,107.72 },
		["7"] = { -1130.59,-763.27,18.43,107.72 }
	},
	["35"] = { x = 1725.21, y = 4711.77, z = 42.11,
		["1"] = { 1722.82,4700.38,42.28,87.88 }
	},
	["36"] = { x = 1624.05, y = 3566.14, z = 35.15,
		["1"] = { 1633.27,3563.91,34.91,303.31 }
	},

	-- Paramedic-1 (Public)
	["37"] = { x = 1162.7, y = -1477.81, z = 34.85,
		["1"] = { 1150.2,-1477.26,34.46,0.0 }
	},
	-- HeliParamedic-1 (Public)
	["38"] = { x = 1193.44, y = -1487.57, z = 34.85,
		["1"] = { 1200.66,-1502.24,35.08,181.42 }
	},
	-- Paramedic-2 (Public)
	["39"] = { x = 1835.94, y = 3671.48, z = 34.27,
		["1"] = { 1834.99,3665.03,33.41,212.6 },
		["2"] = { 1831.73,3663.18,33.51,212.6 },
		["3"] = { 1828.42,3661.31,33.56,212.6 }
	},
	-- HeliParamedic-2 (Public)
	["40"] = { x = 1841.95, y = 3675.0, z = 34.27,
		["1"] = { 1846.5,3658.46,33.9,119.06 }
	},
	-- Paramedic-3 (Public)
	["41"] = { x = -253.72, y = 6339.04, z = 32.42,
		["1"] = { -258.47,6347.58,32.1,269.3 },
		["2"] = { -261.6,6344.21,32.1,269.3 },
		["3"] = { -264.97,6340.84,32.1,272.13 }
	},
	-- HeliParamedic-3 (Public)
	["42"] = { x = -266.03, y = 6326.8, z = 32.42,
		["1"] = { -273.13,6329.85,32.1,133.23 }
	},

	-- Police-1 (Public)
	["43"] = { x = -957.11, y = -2057.36, z = 9.4,
		["1"] = { -960.05,-2062.39,9.12,133.23 }
	},
	-- HeliPolice-1 (Public)
	["44"] = { x = -943.23, y = -2020.73, z = 11.32,
		["1"] = { -950.33,-2021.68,11.71,42.52 }
	},
	-- Police-2 (Public)
	["45"] = { x = 863.73, y = -1346.42, z = 26.03,
		["1"] = { 871.23,-1350.02,25.91,87.88 }
	},
	-- HeliPolice-2 (Public)
	["46"] = { x = 829.43, y = -1402.0, z = 26.15,
		["1"] = { 837.21,-1407.21,26.22,300.48 }
	},
	-- Police-3 (Public)
	["47"] = { x = 1840.74, y = 2545.92, z = 45.66,
		["1"] = { 1833.59,2542.09,45.54,272.13 }
	},
	-- BusPolice-3 (Public)
	["48"] = { x = 1840.75, y = 2538.27, z = 45.66,
		["1"] = { 1833.59,2542.09,45.54,272.13 }
	},
	-- Police-4 (Public)
	["49"] = { x = 1856.95, y = 3683.82, z = 34.27,
		["1"] = { 1853.74,3675.92,33.41,212.6 },
		["2"] = { 1850.5,3674.06,33.43,209.77 },
		["3"] = { 1847.21,3672.24,33.38,209.77 }
	},
	-- HeliPolice-4 (Public)
	["50"] = { x = 1867.59, y = 3656.54, z = 35.6,
		["1"] = { 1865.28,3647.61,35.69,215.44 }
	},
	-- Police-5 (Public)
	["51"] = { x = -480.38, y = 6017.54, z = 31.34,
		["1"] = { -482.7,6024.95,31.0,226.78 },
		["2"] = { -479.61,6028.09,31.0,226.78 },
		["3"] = { -476.09,6031.71,31.0,226.78 },
		["4"] = { -472.45,6035.42,31.0,226.78 },
		["5"] = { -469.04,6038.77,31.0,226.78 }
	},
	-- HeliPolice-5 (Public)
	["52"] = { x = -479.35, y = 6011.16, z = 31.29,
		["1"] = { -475.29,5988.55,31.0,317.49 }
	},

	-- Harmony (Public)
	["53"] = { x = 1169.53, y = 2644.21, z = 37.81,
		["1"] = { 1167.02,2640.32,37.9,0.0 }
	},
	-- Ottos (Public)
	["54"] = { x = 821.94, y = -831.87, z = 26.25,
		["1"] = { 819.05,-826.03,26.3,0.0 }
	},
	-- Tuners (Public)
	["55"] = { x = 157.76, y = -3009.03, z = 7.03,
		["1"] = { 165.14,-3009.37,6.0,272.13 }
	},

	-- Pearls (Restaurants)
	["56"] = { x = -1851.34, y = -1202.29, z = 13.01,
		["1"] = { -1856.53,-1203.63,13.04,240.95 }
	},

	-- Bus (Restaurants)
	["57"] = { x = 453.74, y = -600.6, z = 28.59,
		["1"] = { 462.81,-606.03,28.49,212.6 },
		["2"] = { 461.54,-612.34,28.49,215.44 },
		["3"] = { 460.98,-619.81,28.49,215.44 }
	},

	-- Impound (Works)
	["58"] = { x = -154.58, y = -1174.78, z = 23.99,
		["1"] = { -142.87,-1180.58,23.86,90.71 }
	},

	-- Lumberman (Works)
	["59"] = { x = -842.47, y = 5403.79, z = 34.61,
		["1"] = { -838.49,5405.64,33.78,345.83 }
	},

	-- Transporter (Works)
	["60"] = { x = 355.15, y = 275.79, z = 103.15,
		["1"] = { 359.95,272.31,102.72,340.16 },
		["2"] = { 364.05,270.74,102.68,340.16 },
		["3"] = { 368.1,269.31,102.67,340.16 }
	},

	-- Trash (Works)
	["61"] = { x = 84.18, y = -1552.0, z = 29.59,
		["1"] = { 80.56,-1541.11,29.17,48.19 },
		["2"] = { 76.58,-1545.85,29.17,48.19 },
		["3"] = { 72.59,-1550.58,29.17,48.19 }
	},

	-- Trash (Works)
	["62"] = { x = 283.93, y = 2849.5, z = 43.64,
		["1"] = { 277.34,2840.0,43.29,28.35 }
	},

	-- Trash (Works)
	["63"] = { x = -412.39, y = 6171.06, z = 31.48,
		["1"] = { -401.19,6167.31,31.24,317.49 }
	},

	-- Trucker (Works)
	["64"] = { x = 1241.65, y = -3262.85, z = 5.53,
		["1"] = { 1271.56,-3287.96,6.10,91.00 },
		["2"] = { 1271.82,-3282.63,6.10,91.00 },
		["3"] = { 1271.95,-3271.04,6.10,91.00 },
		["4"] = { 1272.11,-3266.03,6.10,91.00 }
	},

	-- Chiliad (Ilegal)
	["65"] = { x = 2199.54, y = 5563.94, z = 53.85,
		["1"] = { 2202.99,5569.03,53.99,354.34 }
	},
	-- Families (Ilegal)
	["66"] = { x = 2199.54, y = -1636.48, z = 33.35,
		["1"] = { -179.88,-1643.32,33.53,0.0 }
	},
	-- Highways (Ilegal)
	["67"] = { x = 1436.08, y = 6359.61, z = 23.84,
		["1"] = { 1438.29,6353.94,24.08,286.3 }
	},
	-- Vagos (Ilegal)
	["68"] = { x = 326.79, y = -2019.94, z = 21.4,
		["1"] = { 325.52,-2025.98,20.2,138.9 },
		["2"] = { 323.66,-2023.63,20.14,138.9 }
	},

	-- Barragem (Ilegal)
	["69"] = { x = 1317.34, y = -133.58, z = 115.76,
		["1"] = { 1322.01,-137.07,114.98,277.8 }
	},
	-- Farol (Ilegal)
	["70"] = { x = 3291.01, y = 5134.59, z = 19.12,
		["1"] = { 3290.01,5131.35,19.12,82.21 }
	},
	-- Parque (Ilegal)
	["71"] = { x = 393.31, y = 783.8, z = 187.39,
		["1"] = { 395.39,782.37,187.52,130.4 }
	},
	-- Sandy (Ilegal)
	["72"] = { x = 2334.91, y = 4019.61, z = 35.15,
		["1"] = { 2337.99,4017.46,34.37,85.04 },
		["2"] = { 2337.41,4014.24,34.37,85.04 },
		["3"] = { 2336.76,4011.04,34.37,82.21 }
	},
	-- Petróleo (Ilegal)
	["73"] = { x = 1466.52, y = -2420.95, z = 66.81,
		["1"] = { 1469.33,-2419.06,66.78,65.2 }
	},
	-- Praia-1 (Ilegal)
	["74"] = { x = -3134.59, y = 1411.43, z = 24.68,
		["1"] = { -3139.67,1411.77,24.62,308.98 }
	},
	-- Praia-2 (Ilegal)
	["75"] = { x = -3068.8, y = 1653.3, z = 38.11,
		["1"] = { -3069.21,1657.97,37.34,300.48 }
	},
	-- Zancudo (Ilegal)
	["76"] = { x = -595.01, y = 2137.46, z = 129.54,
		["1"] = { -598.61,2141.52,129.84,201.26 }
	},

	-- Madrazzo (Ilegal)
	["77"] = { x = 1400.76, y = 1115.41, z = 114.83,
		["1"] = { 1403.41,1118.34,115.07,90.71 }
	},
	-- Playboy (Ilegal)
	["78"] = { x = -1535.78, y = 94.42, z = 56.77,
		["1"] = { -1527.75,89.91,56.83,257.96 }
	},
	-- TheSouth (Ilegal)
	["79"] = { x = 980.15, y = -109.64, z = 74.36,
		["1"] = { 980.51,-114.14,74.41,133.23 }
	},
	-- Vineyard (Ilegal)
	["80"] = { x = -1929.13, y = 2037.17, z = 140.83,
		["1"] = { -1921.78,2040.11,140.97,257.96 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLEMODS
-----------------------------------------------------------------------------------------------------------------------------------------
function VehicleMods(Vehicle,Customize)
	if Customize then
		SetVehicleModKit(Vehicle,0)

		if Customize["wheeltype"] ~= nil then
			SetVehicleWheelType(Vehicle,Customize["wheeltype"])
		end

		if Customize["mods"] then
			for i = 0,16 do
				if Customize["mods"][tostring(i)] ~= nil then
					SetVehicleMod(Vehicle,i,Customize["mods"][tostring(i)])
				end
			end

			for i = 17,22 do
				if Customize["mods"][tostring(i)] ~= nil then
					ToggleVehicleMod(Vehicle,i,Customize["mods"][tostring(i)])
				end
			end

			for i = 23,24 do
				if Customize["mods"][tostring(i)] ~= nil then
					if not Customize["var"] then
						Customize["var"] = {}
						Customize["var"][tostring(i)] = 0
					end

					SetVehicleMod(Vehicle,i,Customize["mods"][tostring(i)],Customize["var"][tostring(i)])
				end
			end

			for i = 25,48 do
				if Customize["mods"][tostring(i)] ~= nil then
					SetVehicleMod(Vehicle,i,Customize["mods"][tostring(i)])
				end
			end
		end

		if Customize["neon"] ~= nil then
			for i = 0,3 do
				SetVehicleNeonLightEnabled(Vehicle,i,Customize["neon"][tostring(i)])
			end
		end

		if Customize["extras"] ~= nil then
			for i = 1,12 do
				local onoff = tonumber(Customize["extras"][i])
				if onoff == 1 then
					SetVehicleExtra(Vehicle,i,0)
				else
					SetVehicleExtra(Vehicle,i,1)
				end
			end
		end

		if Customize["liverys"] ~= nil and Customize["liverys"] ~= 24  then
			SetVehicleLivery(Vehicle,Customize["liverys"])
		end

		if Customize["plateIndex"] ~= nil and Customize["plateIndex"] ~= 4 then
			SetVehicleNumberPlateTextIndex(Vehicle,Customize["plateIndex"])
		end

		SetVehicleXenonLightsColour(Vehicle,Customize["xenonColor"])
		SetVehicleColours(Vehicle,Customize["colors"][1],Customize["colors"][2])
		SetVehicleExtraColours(Vehicle,Customize["extracolors"][1],Customize["extracolors"][2])
		SetVehicleNeonLightsColour(Vehicle,Customize["lights"][1],Customize["lights"][2],Customize["lights"][3])
		SetVehicleTyreSmokeColor(Vehicle,Customize["smokecolor"][1],Customize["smokecolor"][2],Customize["smokecolor"][3])

		if Customize["tint"] ~= nil then
			SetVehicleWindowTint(Vehicle,Customize["tint"])
		end

		if Customize["dashColour"] ~= nil then
			SetVehicleInteriorColour(Vehicle,Customize["dashColour"])
		end

		if Customize["interColour"] ~= nil then
			SetVehicleDashboardColour(Vehicle,Customize["interColour"])
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNPOSITION
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.SpawnPosition(Select)
	local Slot = "0"
	local Checks = 0
	local Selected = {}
	local Position = nil

	repeat
		Checks = Checks + 1

		Slot = tostring(Checks)
		if Garages[Select][Slot] ~= nil then
			local _,Groundz = GetGroundZAndNormalFor_3dCoord(Garages[Select][Slot][1],Garages[Select][Slot][2],Garages[Select][Slot][3])
			Selected = { Garages[Select][Slot][1],Garages[Select][Slot][2],Groundz,Garages[Select][Slot][4] }
			Position = GetClosestVehicle(Selected[1],Selected[2],Selected[3],2.501,0,71)
		end
	until not DoesEntityExist(Position) or not Garages[Select][Slot]

	if not Garages[Select][tostring(Checks)] then
		TriggerEvent("Notify","amarelo","Vagas estão ocupadas.",5000)
		return false
	end

	return Selected
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.CreateVehicle(Model,Network,Engine,Health,Customize,Windows,Tyres)
	if NetworkDoesNetworkIdExist(Network) then
		local Vehicle = NetToEnt(Network)
		if DoesEntityExist(Vehicle) then
			if Customize ~= nil then
				local Mods = json.decode(Customize)
				VehicleMods(Vehicle,Mods)
			end

			SetVehicleEngineHealth(Vehicle,Engine + 0.0)
			SetEntityHealth(Vehicle,Health)

			if Windows then
				local Windows = json.decode(Windows)
				if Windows ~= nil then
					for k,v in pairs(Windows) do
						if not v then
							RemoveVehicleWindow(Vehicle,parseInt(k))
						end
					end
				end
			end

			if Tyres then
				local Tyres = json.decode(Tyres)
				if Tyres ~= nil then
					for k,Burst in pairs(Tyres) do
						if Burst then
							SetVehicleTyreBurst(Vehicle,parseInt(k),true,1000.0)
						end
					end
				end
			end

			if Model == "maverick2" then
				if LocalPlayer["state"]["Police"] then
					SetVehicleLivery(Vehicle,0)
				elseif LocalPlayer["state"]["Paramedic"] then
					SetVehicleLivery(Vehicle,1)
				end
			end

			if not DecorExistOn(Vehicle,"PlayerVehicle") then
				DecorSetInt(Vehicle,"PlayerVehicle",-1)
			end

			SetModelAsNoLongerNeeded(Model)
		end
	end

	SendNUIMessage({ action = "Visible", data = false })
	SetNuiFocus(false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:DELETE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:Delete")
AddEventHandler("garages:Delete",function(Vehicle)
	if not Vehicle or Vehicle == "" then
		Vehicle = vRP.ClosestVehicle(15)
	end

	if IsEntityAVehicle(Vehicle) then
		local Tyres = {}
		local Doors = {}
		local Windows = {}

		for i = 0,5 do
			Doors[i] = IsVehicleDoorDamaged(Vehicle,i)
		end

		for i = 0,5 do
			Windows[i] = IsVehicleWindowIntact(Vehicle,i)
		end

		for i = 0,7 do
			local Status = false

			if GetTyreHealth(Vehicle,i) ~= 1000.0 then
				Status = true
			end

			Tyres[i] = Status
		end

		if DecorExistOn(Vehicle,"PlayerVehicle") then
			DecorRemove(Vehicle,"PlayerVehicle")
		end

		vSERVER.Delete(VehToNet(Vehicle),GetEntityHealth(Vehicle),GetVehicleEngineHealth(Vehicle),GetVehicleBodyHealth(Vehicle),GetVehicleFuelLevel(Vehicle),Doors,Windows,Tyres,GetVehicleNumberPlateText(Vehicle))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCHBLIP
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.SearchBlip(Coords)
	if DoesBlipExist(Searched) then
		RemoveBlip(Searched)
		Searched = nil
	end

	Searched = AddBlipForCoord(Coords["x"],Coords["y"],Coords["z"])
	SetBlipSprite(Searched,225)
	SetBlipColour(Searched,2)
	SetBlipScale(Searched,0.6)
	SetBlipAsShortRange(Searched,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Veículo")
	EndTextCommandSetBlipName(Searched)

	SetTimeout(30000,function()
		RemoveBlip(Searched)
		Searched = nil
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.StartHotwired()
	Hotwired = true

	if LoadAnim(Dict) then
		TaskPlayAnim(PlayerPedId(),Dict,Anim,8.0,8.0,-1,49,5.0,0,0,0)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.StopHotwired(Vehicle)
	Hotwired = false

	if LoadAnim(Dict) then
		StopAnimTask(PlayerPedId(),Dict,Anim,8.0)
	end

	if Vehicle then
		SetEntityAsMissionEntity(Vehicle,true,false)
		SetVehicleHasBeenOwnedByPlayer(Vehicle,true)
		SetVehicleNeedsToBeHotwired(Vehicle,false)

		if not DecorExistOn(Vehicle,"PlayerVehicle") then
			DecorSetInt(Vehicle,"PlayerVehicle",-1)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.UpdateHotwired(Status)
	Hotwired = Status
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOOPHOTWIRED
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	--if not LocalPlayer["state"]["TestDrive"] then
		while true do
			local TimeDistance = 999
			local Ped = PlayerPedId()
			if IsPedInAnyVehicle(Ped) then
				local Vehicle = GetVehiclePedIsUsing(Ped)
				local Plate = GetVehicleNumberPlateText(Vehicle)
				if GetPedInVehicleSeat(Vehicle,-1) == Ped and not GlobalState["Plates"][Plate] and Plate ~= "PDMSPORT" then
					SetVehicleEngineOn(Vehicle,false,true,true)
					DisablePlayerFiring(Ped,true)
					TimeDistance = 1
				end

				if Hotwired and Vehicle then
					DisableControlAction(1,75,true)
					DisableControlAction(1,20,true)
					TimeDistance = 1
				end
			end

			Wait(TimeDistance)
		end
	--end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:IMPOUND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:Impound")
AddEventHandler("garages:Impound",function()
	local Impound = vSERVER.Impound()
	if parseInt(#Impound) > 0 then
		for k,v in pairs(Impound) do
			exports["dynamic"]:AddButton(v["name"],"Clique para iniciar a liberação.","garages:Impound",v["Model"],false,true)
		end

		exports["dynamic"]:openMenu()
	else
		TriggerEvent("Notify","amarelo","Não possui veículos apreendidos.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GARAGES:PROPERTYS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garages:Propertys")
AddEventHandler("garages:Propertys",function(Table)
	for Name,v in pairs(Table) do
		Garages[Name] = {
			["x"] = v["x"],
			["y"] = v["y"],
			["z"] = v["z"],
			["1"] = v["1"]
		}
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local TimeDistance = 999
		local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped) then
			local Coords = GetEntityCoords(Ped)

			for Number,v in pairs(Garages) do
				local Distance = #(Coords - vec3(v["x"],v["y"],v["z"]))
				if Distance <= 15 then
					DrawMarker(23,v["x"],v["y"],v["z"] - 0.95,0.0,0.0,0.0,0.0,0.0,0.0,1.75,1.75,0.0,96,10,245,100,0,0,0,0)
					TimeDistance = 1
			
					if Distance <= 1.25 and IsControlJustPressed(1,38) then
						local garagem = vSERVER.Vehicles(Number)
						if garagem then
							Opened = Number
							SetNuiFocus(true,true)
							SendNUIMessage({ action = "Visible", data = true })
							SendNUIMessage({ action = "OpenGarage", data = garagem })
						end	
					end
				end
			end
		end

		Wait(TimeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ action = "Visible", data = false })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKEVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("takeVehicle",function(Data,Callback)
	if GetGameTimer() >= Cooldown then
		Cooldown = GetGameTimer() + 5000
		vSERVER.Spawn(Data["model"],Opened)
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOREVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("storeVehicle",function(Data,Callback)
	if GetGameTimer() >= Cooldown then
		Cooldown = GetGameTimer() + 5000
		TriggerEvent("garages:Delete")
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELLVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("sellVehicle",function(Data,Callback)
	SendNUIMessage({ action = "Visible", data = false })
	SetNuiFocus(false,false)

	vSERVER.Sell(Data["model"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRANSFERVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("transferVehicle",function(Data,Callback)
	SendNUIMessage({ action = "Visible", data = false })
	SetNuiFocus(false,false)

	vSERVER.Transfer(Data["model"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAXVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("taxVehicle",function(Data,Callback)
	SendNUIMessage({ action = "Visible", data = false })
	SetNuiFocus(false,false)

	vSERVER.Tax(Data["model"])

	Callback("Ok")
end)