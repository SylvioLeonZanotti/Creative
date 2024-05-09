-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Kaduzera = {}
Tunnel.bindInterface("dismantled", Kaduzera)
vGARAGES = Tunnel.getInterface("garages")
vCLIENT = Tunnel.getInterface("dismantled")



local desmanche = "https://discord.com/api/webhooks/1129692171319119962/1DAMT5lcb-NhTFbRWqbc6cJzy1h7LrYfB6IBWYtEdGeop9X1ubimTUdQ7dB9ofHgVzcq"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

------------------------------------------------------
-- CONFIG 
------------------------------------------------------
local RestritoParaDesmanche = false -- É restrito para quem tiver só a permissão do desmanche? (TRUE/FALSE)
local PermissaoDesmanche = 'Admin' or 'Mechanic' -- Se RestritoParaDesmanche for TRUE, aqui deverá ter a permissão que será verifiada.

local CarrosDesmanches = {
    --==============================================================
    -- configure o nome do veículo e valor que recebe ao desmanchar
    -- geralmente configuro 10% do valor do veículo
    --==============================================================

    ['blista'] = 6000,
    ['brioso'] = 3500,
    ['dilettante'] = 6000,
    ['issi2'] = 7500,
    ['panto'] = 1000,
    ['prairie'] = 200,
    ['rhapsody'] = 1400,
    ['cogcabrio'] = 10000,
    ['emperor'] = 10000,
    ['emperor2'] = 10000,
    ['phoenix'] = 25000,
    ['premier'] = 7000,
    ['glendale'] = 14000,
    ['intruder'] = 12000,
    ['exemplar'] = 16000,
    ['f620'] = 11000,
    ['felon'] = 14000,
    ['ingot'] = 15500,
    ['felon2'] = 200,
    ['jackal'] = 12000,
    ['oracle'] = 12000,
    ['oracle2'] = 16000,
    ['sentinel'] = 10000,
    ['sentinel2'] = 12000,
    ['windsor'] = 15000,
    ['windsor2'] = 17000,
    ['zion'] = 10000,
    ['zion2'] = 12000,
    ['blade'] = 22000,
    ['buccaneer'] = 26000,
    ['buccaneer2'] = 21000,
    ['primo'] = 6000,
    ['primo2'] = 8000,
    ['chino'] = 6000,
    ['chino2'] = 10000,
    ['coquette3'] = 9000,
    ['dominator'] = 6000,
    ['dukes'] = 8000,
    ['faction'] = 11000,
    ['faction2'] = 10000,
    ['faction3'] = 10000,
    ['gauntlet'] = 10000,
    ['gauntlet2'] = 33000,
    ['hermes'] = 16000,
    ['hotknife'] = 16000,
    ['moonbeam'] = 14000,
    ['moonbeam2'] = 20000,
    ['nightshade'] = 14000,
    ['picador'] = 10000,
    ['ruiner'] = 10000,
    ['sabregt'] = 10000,
    ['sabregt2'] = 10000,
    ['gburrito'] = 10000,
    ['slamvan'] = 10000,
    ['slamvan2'] = 10000,
    ['slamvan3'] = 10000,
    ['stalion'] = 10000,
    ['stalion2'] = 10000,
    ['tampa'] = 10000,
    ['vigero'] = 10000,
    ['virgo'] = 10000,
    ['virgo2'] = 10000,
    ['virgo3'] = 10000,
    ['voodoo'] = 10000,
    ['voodoo2'] = 10000,
    ['yosemite'] = 10000,
    ['bfinjection'] = 10000,
    ['bifta'] = 10000,
    ['bodhi2'] = 10000,
    ['brawler'] = 10000,
    ['trophytruck'] = 10000,
    ['trophytruck2'] = 10000,
    ['dubsta3'] = 10000,
    ['mesa3'] = 10000,
    ['rancherxl'] = 10000,
    ['rebel'] = 200,
    ['rebel2'] = 10000,
    ['riata'] = 10000,
    ['dloader'] = 10000,
    ['sandking'] = 10000,
    ['sandking2'] = 10000,
    ['baller'] = 10000,
    ['baller2'] = 10000,
    ['baller3'] = 10000,
    ['baller4'] = 10000,
    ['baller5'] = 10000,
    ['baller6'] = 10000,
    ['bjxl'] = 10000,
    ['cavalcade'] = 22000,
    ['cavalcade2'] = 10000,
    ['contender'] = 10000,
    ['dubsta'] = 10000,
    ['dubsta2'] = 48000,
    ['fq2'] = 22000,
    ['granger'] = 10000,
    ['gresley'] = 30000,
    ['habanero'] = 22000,
    ['seminole'] = 22000,
    ['serrano'] = 10000,
    ['xls'] = 10000,
    ['xls2'] = 10000,
    ['asea'] = 11000,
    ['asterope'] = 13000,
    ['cog55'] = 10000,
    ['cog552'] = 10000,
    ['cognoscenti'] = 10000,
    ['cognoscenti2'] = 10000,
    ['stanier'] = 10000,
    ['stratum'] = 18000,
    ['superd'] = 10000,
    ['surge'] = 22000,
    ['tailgater'] = 22000,
    ['warrener'] = 18000,
    ['washington'] = 26000,
    ['alpha'] = 10000,
    ['banshee'] = 25000,
    ['bestiagts'] = 10000,
    ['blista2'] = 11000,
    ['blista3'] = 16000,
    ['buffalo'] = 10000,
    ['buffalo2'] = 10000,
    ['buffalo3'] = 10000,
    ['carbonizzare'] = 18000,
    ['comet2'] = 20000,
    ['comet3'] = 18000,
    ['comet5'] = 14000,
    ['coquette'] = 15000,
    ['elegy'] = 17000,
    ['elegy2'] = 11000,
    ['feltzer2'] = 11000,
    ['furoregt'] = 18000,
    ['fusilade'] = 12000,
    ['futo'] = 14000,
    ['jester'] = 11000,
    ['khamelion'] = 11000,
    ['kuruma'] = 11000,
    ['massacro'] = 11000,
    ['massacro2'] = 11000,
    ['ninef'] = 11000,
    ['ninef2'] = 11000,
    ['omnis'] = 11000,
    ['pariah'] = 11000,
    ['penumbra'] = 11000,
    ['raiden'] = 11000,
    ['rapidgt'] = 11000,
    ['rapidgt2'] = 11000,
    ['ruston'] = 11000,
    ['schafter3'] = 11000,
    ['schafter4'] = 11000,
    ['schafter5'] = 11000,
    ['schwarzer'] = 11000,
    ['sentinel3'] = 11000,
    ['seven70'] = 11000,
    ['specter'] = 11000,
    ['specter2'] = 11000,
    ['streiter'] = 11000,
    ['sultan'] = 11000,
    ['surano'] = 11000,
    ['tampa2'] = 11000,
    ['tropos'] = 11000,
    ['verlierer2'] = 11000,
    ['btype'] = 11000,
    ['btype2'] = 11000,
    ['btype3'] = 11000,
    ['casco'] = 11000,
    ['cheetah'] = 11000,
    ['coquette2'] = 11000,
    ['feltzer3'] = 11000,
    ['gt500'] = 11000,
    ['infernus2'] = 11000,
    ['jb700'] = 11000,
    ['mamba'] = 11000,
    ['manana'] = 11000,
    ['monroe'] = 11000,
    ['peyote'] = 11000,
    ['pigalle'] = 11000,
    ['rapidgt3'] = 11000,
    ['retinue'] = 11000,
    ['stinger'] = 11000,
    ['stingergt'] = 11000,
    ['torero'] = 11000,
    ['tornado'] = 11000,
    ['tornado2'] = 11000,
    ['tornado5'] = 11000,
    ['tornado6'] = 11000,
    ['turismo2'] = 11000,
    ['ztype'] = 11000,
    ['adder'] = 11000,
    ['autarch'] = 11000,
    ['banshee2'] = 11000,
    ['bullet'] = 11000,
    ['cheetah2'] = 11000,
    ['entityxf'] = 11000,
    ['fmj'] = 11000,
    ['gp1'] = 11000,
    ['infernus'] = 11000,
    ['nero'] = 11000,
    ['nero2'] = 11000,
    ['osiris'] = 11000,
    ['penetrator'] = 11000,
    ['pfister811'] = 11000,
    ['reaper'] = 11000,
    ['sc1'] = 11000,
    ['sultanrs'] = 11000,
    ['t20'] = 11000,
    ['tempesta'] = 11000,
    ['turismor'] = 11000,
    ['tyrus'] = 11000,
    ['vacca'] = 11000,
    ['visione'] = 11000,
    ['voltic'] = 11000,
    ['zentorno'] = 11000,
    ['sadler'] = 11000,
    ['bison'] = 11000,
    ['bison2'] = 11000,
    ['bobcatxl'] = 11000,
    ['burrito'] = 11000,
    ['burrito2'] = 11000,
    ['burrito3'] = 11000,
    ['burrito4'] = 11000,
    ['minivan'] = 11000,
    ['minivan2'] = 11000,
    ['paradise'] = 11000,
    ['pony'] = 11000,
    ['pony2'] = 11000,
    ['rumpo'] = 11000,
    ['rumpo2'] = 11000,
    ['rumpo3'] = 11000,
    ['speedo'] = 11000,
    ['surfer'] = 11000,
    ['youga'] = 200,
    ['youga2'] = 200,
    ['tractor2'] = 200,
    ['huntley'] = 11000,
    ['landstalker'] = 11000,
    ['mesa'] = 11000,
    ['patriot'] = 11000,
    ['radi'] = 11000,
    ['rocoto'] = 11000,
    ['tyrant'] = 11000,
    ['entity2'] = 11000,
    ['cheburek'] = 11000,
    ['hotring'] = 11000,
    ['jester3'] = 11000,
    ['flashgt'] = 11000,
    ['ellie'] = 11000,
    ['michelli'] = 11000,
    ['fagaloa'] = 11000,
    ['dominator2'] = 11000,
    ['dominator3'] = 11000,
    ['issi3'] = 11000,
    ['taipan'] = 11000,
    ['gb200'] = 11000,
    ['stretch'] = 11000,
    ['guardian'] = 11000,
    ['kamacho'] = 11000,
    ['neon'] = 11000,
    ['cyclone'] = 11000,
    ['italigtb'] = 11000,
    ['italigtb2'] = 11000,
    ['vagner'] = 11000,
    ['xa21'] = 11000,
    ['tezeract'] = 11000,
    ['prototipo'] = 11000,
    ['patriot2'] = 11000,
    ['stafford'] = 11000,
    ['swinger'] = 11000,
    ['clique'] = 11000,
    ['deveste'] = 11000,
    ['deviant'] = 11000,
    ['impaler'] = 11000,
    ['italigto'] = 11000,
    ['schlagen'] = 11000,
    ['toros'] = 11000,
    ['tulip'] = 11000,
    ['vamos'] = 11000,
    ['freecrawler'] = 11000,
    ['fugitive'] = 11000,
    ['le7b'] = 11000,
    ['lurcher'] = 11000,
    ['lynx'] = 11000,
    ['sheava'] = 140000,
    ['z190'] = 11000,
    ['akuma'] = 11000,
    ['avarus'] = 11000,
    ['bagger'] = 11000,
    ['bati'] = 11000,
    ['bati2'] = 11000,
    ['bf400'] = 11000,
    ['carbonrs'] = 11000,
    ['chimera'] = 11000,
    ['cliffhanger'] = 11000,
    ['daemon'] = 11000,
    ['daemon2'] = 11000,
    ['defiler'] = 11000,
    ['diablous'] = 11000,
    ['diablous2'] = 11000,
    ['double'] = 11000,
    ['enduro'] = 11000,
    ['esskey'] = 11000,
    ['faggio'] = 800,
    ['faggio2'] = 1000,
    ['faggio3'] = 1000,
    ['fcr'] = 11000,
    ['fcr2'] = 11000,
    ['gargoyle'] = 11000,
    ['hakuchou'] = 11000,
    ['hakuchou2'] = 11000,
    ['hexer'] = 11000,
    ['innovation'] = 11000,
    ['lectro'] = 16000,
    ['manchez'] = 10000,
    ['nemesis'] = 19000,
    ['nightblade'] = 13000,
    ['pcj'] = 16000,
    ['ruffian'] = 19000,
    ['sanchez'] = 17000,
    ['sanchez2'] = 17000,
    ['sanctus'] = 40000,
    ['sovereign'] = 17000,
    ['thrust'] = 15000,
    ['vader'] = 19000,
    ['vindicator'] = 18000,
    ['vortex'] = 15000,
    ['wolfsbane'] = 18000,
    ['zombiea'] = 18000,
    ['zombieb'] = 60000,
    ['blazer'] = 16000,
    ['blazer4'] = 14000,
    ['shotaro'] = 20000,
    ['ratbike'] = 16000,
    ['rallytruck'] = 12000,
    ['flatbed'] = 200,
    ['ratloader'] = 200,
    ['ratloader2'] = 200,
    ['taxi'] = 200,
    ['boxville4'] = 200,
    ['trash2'] = 200,
    ['trash'] = 200,
    ['tiptruck'] = 200,
    ['scorcher'] = 200,
    ['tribike'] = 200,
    ['tribike2'] = 200,
    ['tribike3'] = 200,
    ['fixter'] = 200,
    ['cruiser'] = 200,
    ['bmx'] = 200,
    ['dinghy'] = 200,
    ['speeder'] = 200,
    ['suntrap'] = 200,
    ['tropic'] = 200,
}

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


------------------------------------------------------
--- RETORNA VEICULOS PERMITIDOS ------
------------------------------------------------------
function Kaduzera.GetVehs()
    return CarrosDesmanches
end


------------------------------------------------------
--- FUNÇÃO VERIFICAR PERMISSÃO DO DESMANCHE ------
------------------------------------------------------
function Kaduzera.CheckPerm()
    local source = source
    local Passport = vRP.Passport(source)
    if RestritoParaDesmanche then
        if vRP.hasPermission(Passport, PermissaoDesmanche) then
            return true
        end
        return false
    end
    return true
end
------------------------------------------------------
-- FUNÇÃO PRA VERIFICAR SE POSSUI O ITEM
------------------------------------------------------
function Kaduzera.CheckItem()
    local source = source
	local Passport = vRP.Passport(source)
    if Passport then
        local consultItem = vRP.InventoryItemAmount(Passport,"desmanche")
        if consultItem[1] <= 0 then
            return false
        end
        return true
    end
end

------------------------------------------------------
-- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
------------------------------------------------------
function Kaduzera.GerarPagamento(placa, nomeFeio, nomeBonito, nPassport)
    local source = source
    local Passport = vRP.Passport(source)
	local identity = vRP.Identity(Passport)

------------------------------------------------------
-- REALIZA O PAGAMENTO
------------------------------------------------------
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            vRP.GenerateItem(Passport,'dollarsroll',pagamento,true) -- DINHEIRO SUJO
            vRP.RemoveItem(Passport,'desmanche',1,true)
            TriggerClientEvent('Notify',source,'verde','Você recebeu <b>R$'..pagamento..'</b> pelo desmanche de um <b>'..nomeBonito..' ('.. nomeFeio..' - PLACA [' .. placa .. '])</b>.',20000)
            vRP.UpgradeStress(Passport,5)
            SendWebhookMessage(desmanche,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..Passport.." \n[DESMANCHOU]: "..nomeBonito.." \n[PLACA]: "..placa.." \n[E RECEBEU]: "..pagamento.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    end
end