------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------

-- Aop command
if config.enableAopCommand then
    RegisterNetEvent("registerAop")
    AddEventHandler("registerAop", function(aopRegistered)
        aop = aopRegistered
        TriggerClientEvent("setAop", -1, aop)
    end)
    RegisterNetEvent("getAop")
    AddEventHandler("getAop", function()
        local player = source
        if aop == nil then
            aop = config.defaultAop
        end
        TriggerClientEvent("returnAop", player, aop)
    end)
end

-- Twotter command
RegisterNetEvent("twt")
AddEventHandler("twt", function(id, twtName, twt)
    TriggerClientEvent("twt", -1, id, twtName, twt)
end)

-- Me command
RegisterNetEvent("me")
AddEventHandler("me", function(id, name, msg, coords)
    TriggerClientEvent("me", -1, id, name, msg, coords)
end)

-- OOC command
RegisterCommand("ooc", function(source, args, rawCommand)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {150, 150, 150},
        args = {"^*OOC | ^0" .. GetPlayerName(source) .. " (#" .. source .. ")", string.gsub(rawCommand, "ooc", "")}
    })
end, false)

-- Darkweb command
RegisterCommand("darkweb", function(source, args, rawCommand)
    TriggerClientEvent("chat:addMessage", -1, {
        color = {0, 0, 0},
        args = {"^*Dark web | ^0Anonymous (#" .. source .. ")", string.gsub(rawCommand, "darkweb", "")}
    })
end, false)