
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
tvRP = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("spawn",Kaduzera)

local Global = {}

function Kaduzera.Characters()
	local Character = {}
	local source = source
	local License = vRP.Identities(source)
	local Consult = vRP.Query("characters/Characters",{ license = License })

	TriggerEvent("vRP:BucketServer",source,"Enter",source)

	if Consult[1] then
		for _,v in pairs(Consult) do
			local Datatable = vRP.UserData(v["id"],"Datatable")
			if Datatable then
				table.insert(Character,{
					["Passport"] = v["id"],
					["Skin"] = Datatable["Skin"],
					["Nome"] = v["name"].." "..v["name2"],
					["Sexo"] = v["sex"],
					["Banco"] = v["bank"],
					["Blood"] = Sanguine(v["blood"]),
					["Clothes"] = vRP.UserData(v["id"],"Clothings"),
					["Barber"] = vRP.UserData(v["id"],"Barbershop"),
					["Tattoos"] = vRP.UserData(v["id"],"Tatuagens")
				})
			end
		end
	end
	
	return Character
end
function Kaduzera.CharacterChosen(Passport)
  local source = source
  local license = vRP.Identities(source)
  local query = vRP.Query("characters/UserLicense", { id = Passport, license = license})
  if query and query[1] then
    TriggerEvent("vRP:BucketServer", source, "Exit")
    vRP.CharacterChosen(source, Passport)
    return true
  else
    DropPlayer(source, "Conectando em personagem irregular.")
  end
  return false
end


function Kaduzera.NewCharacter(name, name2, sex)
  local source = source
  if not Global[source] then
    Global[source] = true
    local license = vRP.Identities(source)
    local account = vRP.Account(license)
    local query = vRP.Query("characters/countPersons", { license = license })
    local AmountCharacters = parseInt(account["chars"])

    if parseInt(AmountCharacters) <= parseInt(query[1]["qtd"]) then
			TriggerClientEvent("Notify",source,"amarelo","Limite de personagem atingido.",3000)
			Global[source] = nil
			return
		end

    local sexo = "F"
		if sex == "mp_m_freemode_01" then
			sexo = "M"
		end

    vRP.Query("characters/newCharacter", { license = license, name = name, sex = sexo, name2 = name2, phone = vRP.GeneratePhone(), blood = math.random(4) })
    local id = vRP.Query("characters/lastCharacters", { license = license })
    if id[1] then
      TriggerEvent("vRP:BucketServer", source, "Exit")
      vRP.CharacterChosen(source, id[1].id, sex)
    end
    Global[source] = nil
    return true
  end
end

function Kaduzera.FinshSpawn()
	local source = source
	SetPlayerRoutingBucket(source,0)
	tvRP.stopAnim(source,false)
end