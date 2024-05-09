function removePlayerFromCall(source,callChannel)
    callData[callChannel] = callData[callChannel] or {}

    for player,_ in pairs(callData[callChannel]) do
        TriggerClientEvent("pma-voice:removePlayerFromCall",player,source)
    end

    callData[callChannel][source] = nil
    voiceData[source] = voiceData[source] or defaultTable(source)
    voiceData[source].call = 0
end

function addPlayerToCall(source,callChannel)
    callData[callChannel] = callData[callChannel] or {}

    for player,_ in pairs(callData[callChannel]) do
        if player ~= source then
            TriggerClientEvent("pma-voice:addPlayerToCall",player,source)
        end
    end

    callData[callChannel][source] = false
    voiceData[source] = voiceData[source] or defaultTable(source)
    voiceData[source].call = callChannel
    TriggerClientEvent("pma-voice:syncCallData",source,callData[callChannel])
end

function setPlayerCall(source,_callChannel)
    voiceData[source] = voiceData[source] or defaultTable(source)
    local isResource = GetInvokingResource()
    local plyVoice = voiceData[source]
    local callChannel = tonumber(_callChannel)
    if not callChannel then
		if not isResource then
			return
		end
	end

	if isResource then
		TriggerClientEvent("pma-voice:clSetPlayerCall",source,callChannel)
	end

    Player(source).state.callChannel = callChannel

    if callChannel ~= 0 and plyVoice.call == 0 then
        addPlayerToCall(source,callChannel)
    elseif callChannel == 0 then
        removePlayerFromCall(source,plyVoice.call)
    elseif plyVoice.call > 0 then
        removePlayerFromCall(source,plyVoice.call)
        addPlayerToCall(source,callChannel)
    end
end

exports("setPlayerCall",setPlayerCall)

RegisterServerEvent("pma-voice:setPlayerCall",function(callChannel)
    setPlayerCall(source,callChannel)
end)

function setTalkingOnCall(talking)
    local source = source
    voiceData[source] = voiceData[source] or defaultTable(source)
    local plyVoice = voiceData[source]
    local callTbl = callData[plyVoice.call]

    if callTbl then
        for player,_ in pairs(callTbl) do
            if player ~= source then
                TriggerClientEvent("pma-voice:setTalkingOnCall",player,source,talking)
            end
        end
    end
end
RegisterServerEvent("pma-voice:setTalkingOnCall",setTalkingOnCall)