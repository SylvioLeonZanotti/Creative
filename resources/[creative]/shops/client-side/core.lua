-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("shops",Kaduzera)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(Data,Callback)
	SendNUIMessage({ action = "hideNUI" })
	SetNuiFocus(false,false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(Data,Callback)
	local inventoryShop,inventoryUser,invPeso,invMaxpeso,shopSlots = vSERVER.requestShop(Data["shop"])
	if inventoryShop then
		Callback({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(Data,Callback)
	vSERVER.functionShops(Data["shop"],Data["item"],Data["amount"],Data["slot"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(Data,Callback)
	TriggerServerEvent("shops:populateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(Data,Callback)
	TriggerServerEvent("shops:updateSlot",Data["item"],Data["slot"],Data["target"],Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKCHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Kaduzera.updateShops(action)
	SendNUIMessage({ action = action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	-- Ammunation (Framework)
	{ 1692.46,3760.77,35.08,"Ammunation",false },
	{ 253.56,-50.42,70.33,"Ammunation",false },
	{ 842.39,-1035.03,28.6,"Ammunation",false },
	{ -331.43,6084.77,31.83,"Ammunation",false },
	{ -662.23,-933.86,22.22,"Ammunation",false },
	{ -1304.41,-394.57,37.1,"Ammunation",false },
	{ -1118.76,2699.56,18.94,"Ammunation",false },
	{ 2567.97,292.9,109.12,"Ammunation",false },
	{ -3173.26,1088.29,21.2,"Ammunation",false },
	{ 22.51,-1105.77,30.18,"Ammunation",false },
	{ 810.22,-2158.72,30.01,"Ammunation",false },
	-- Departament (Framework)
	{ 24.74,-1346.03,29.95,"Departament",true },
	{ 2556.03,381.14,109.04,"DepartamentMechanic",true },
	{ 1164.58,-323.67,69.59,"Departament",true },
	{ -706.4,-914.57,19.59,"Departament",true },
	{ -47.58,-1758.47,29.85,"Departament",true },
	{ 373.11,327.5,104.01,"Departament",true },
	{ -3243.37,1000.36,13.27,"Departament",true },
	{ 1728.63,6416.13,35.49,"DepartamentMechanic",true },
	{ 548.96,2670.17,42.59,"Departament",true },
	{ 1959.72,3741.19,32.75,"Departament",true },
	{ 2677.15,3280.19,55.66,"DepartamentMechanic",true },
	{ 1697.47,4923.69,42.48,"Departament",true },
	{ -1819.72,793.34,138.48,"Departament",true },
	{ 1392.16,3605.89,35.39,"Departament",true },
	{ -2966.65,391.63,15.46,"Departament",true },
	{ -3040.14,584.45,8.36,"Departament",true },
	{ 1134.57,-983.0,46.81,"Departament",true },
	{ 1165.29,2710.55,38.56,"DepartamentMechanic",true },
	{ -1486.9,-377.76,40.55,"Departament",true },
	{ -1221.54,-907.69,12.73,"Departament",true },
	{ 812.72,-781.17,26.56,"DepartamentMechanic",true },
	-- Criminal (Ilegal)
	{ -195.15,3651.33,51.73,"Criminal",false },
	{ 904.34,3656.56,32.57,"Criminal2",false },
	{ 2450.88,3759.53,41.7,"Criminal3",false },
	{ 1901.86,4925.07,48.86,"Criminal4",false },
	{ -653.12,-1502.67,5.22,"Criminal",false },
	{ 389.71,-942.61,29.42,"Criminal2",false },
	{ 154.98,-1472.47,29.35,"Criminal3",false },
	{ 488.1,-1456.11,29.28,"Criminal4",false },
	-- Danger (Ilegal)
	{ 1045.17,-2510.07,28.74,"Danger",false },
	-- Drinks (Ilegal)
	{ 987.83,-95.28,74.85,"Drinks",false },
	{ -157.19,-1611.54,33.65,"Drinks",false },
	{ 336.64,-1989.09,24.2,"Drinks",false },
	{ 1420.99,6336.16,23.32,"Drinks",false },
	{ 2194.73,5581.52,53.36,"Drinks",false },
	-- Cassino (Framework)
	{ 990.86,32.73,71.62,"Cassino",false },
	{ 989.23,30.03,71.62,"Cassino2",false },
	-- Pharmacy (Framework)
	{ -172.69,6381.16,31.84,"Pharmacy",false },
	{ 1690.07,3581.68,35.62,"Pharmacy",false },
	{ 114.39,-4.85,67.82,"Pharmacy",false },
	{ 326.5,-1074.43,29.47,"Pharmacy",false },     
	-- Premium (Framework)
	{ -1083.15,-245.88,37.76,"Premium",false,2.75 },
	-- Properties (Framework)
	{ -307.63,-164.17,40.42,"Properties",false },
	{ 1655.77,4874.38,42.04,"Properties",false },
	-- Townhall (Framework)
	{ -542.87,-198.35,38.23,"Townhall",false,2.75 },
	{ -551.27,-203.09,38.23,"Townhall",false,2.75 },
	{ -544.76,-185.81,52.2,"Townhall",false,2.75 },
	-- Paramedic (Public)
	{ 1140.12,-1563.59,35.38,"Paramedic",false },
	{ 1839.53,3683.72,34.69,"Paramedic",false },
	{ -254.64,6326.95,32.82,"Paramedic",false },
	-- Police (Public)
	{ -947.81,-2040.48,9.4,"Police",false },
	{ 836.06,-1286.33,28.42,"Police",false },
	{ 1843.22,2573.75,46.32,"Police",false },
	{ 1861.93,3688.11,34.56,"Police",false },
	{ -449.65,6015.39,37.21,"Police",false },
	-- Mechanic (Public)
	{ 1189.63,2636.54,38.39,"Harmony",false },
	{ 836.91,-817.78,26.4,"Ottos",false },
	{ 129.32,-3031.71,7.2,"Mechanic",false },
	{ 474.78,-1318.27,29.2,"Bennys",false },
	{ 120.8,-3021.49,7.04,"MechanicBuy",false },
	-- (Market)
	{ 46.65,-1749.7,29.62,"Megamal",false },
	{ 2747.31,3473.07,55.67,"Megamal",false },
	-- Lasttrain
	{ -380.54,266.09,86.46,"LastTrain",false },
	{ -379.54,266.71,86.46,"LastTrain",false },
	{ 1994.73,3723.5,34.93,"LastTrain",false },
	{ 1996.34,3722.68,34.93,"LastTrain",false },
	{ 1996.91,3721.69,34.93,"LastTrain",false },
	-- (Works)
	{ 1523.46,3782.86,34.87,"Fishing",false },
	{ -679.13,5839.52,17.32,"Hunting",false },
	{ -1593.08,5202.9,4.31,"Hunting2",false },
	{ -628.6,-238.53,38.39,"Miners",false },
	{ -428.54,-1728.29,19.78,"Recycle",false },
	{ 180.07,2793.29,45.65,"Recycle",false },
	{ -195.42,6264.62,31.49,"Recycle",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Open",function(shopId)
	if vSERVER.Verify() then
		if vSERVER.requestPerm(List[shopId][4]) then
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showNUI", name = List[shopId][4], type = vSERVER.getShopType(List[shopId][4]) })

			if List[shopId][5] then
				TriggerEvent("sounds:Private","shop",0.5)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Coffee",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Coffee", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Soda",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Soda", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Donut",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Donut", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Burger",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Burger", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hotdog",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Hotdog", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Chihuahua", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Water",function()
	if LocalPlayer["state"]["Route"] < 900000 then
		SendNUIMessage({ action = "showNUI", name = "Water", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fuel",function()
	SendNUIMessage({ action = "showNUI", name = "Fuel", type = "Buy" })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number,v in pairs(List) do
		exports["target"]:AddCircleZone("Shops:"..Number,vec3(v[1],v[2],v[3]),0.85,{
			name = "Shops:"..Number,
			heading = 3374176
		},{
			shop = Number,
			Distance = v[6] or 1.75,
			options = {
				{
					event = "shops:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)