------------------------------------------------------------------------
------------------------------------------------------------------------
--			DO NOT EDIT IF YOU DON'T KNOW WHAT YOU'RE DOING			  --
--     							 									  --
--	   For support join my discord: https://discord.gg/Z9Mxu72zZ6	  --
------------------------------------------------------------------------
------------------------------------------------------------------------
local aop = "Unknown" -- aop unknown if it's not set.
playerBank = nil

-- Aop command events
RegisterNetEvent("registerAop")
AddEventHandler("registerAop", function(aopRegistered)
    local player = source
    if IsRolePresent(player, "ADMIN") then
        aop = aopRegistered
        TriggerClientEvent("setAop", -1, aop)
    else
        DropPlayer(player, "Tried to use a mod menu to change the aop.")
    end
end)
RegisterNetEvent("getAop")
AddEventHandler("getAop", function()
    local player = source
    TriggerClientEvent("returnAop", player, aop)
end)

-- Twotter command
RegisterCommand("twt", function(source, args, rawCommand)
    local player = source
    local twtName = onlinePlayers[player].twt
    TriggerClientEvent("chat:addMessage", -1, {
        template = "<img src='data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+Cjxz%0D%0AdmcKICB2aWV3Ym94PSIwIDAgMjAwMCAxNjI1LjM2IgogIHdpZHRoPSIyMDAwIgogIGhlaWdodD0i%0D%0AMTYyNS4zNiIKICB2ZXJzaW9uPSIxLjEiCiAgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAv%0D%0Ac3ZnIj4KICA8cGF0aAogICAgZD0ibSAxOTk5Ljk5OTksMTkyLjQgYyAtNzMuNTgsMzIuNjQgLTE1%0D%0AMi42Nyw1NC42OSAtMjM1LjY2LDY0LjYxIDg0LjcsLTUwLjc4IDE0OS43NywtMTMxLjE5IDE4MC40%0D%0AMSwtMjI3LjAxIC03OS4yOSw0Ny4wMyAtMTY3LjEsODEuMTcgLTI2MC41Nyw5OS41NyBDIDE2MDku%0D%0AMzM5OSw0OS44MiAxNTAyLjY5OTksMCAxMzg0LjY3OTksMCBjIC0yMjYuNiwwIC00MTAuMzI4LDE4%0D%0AMy43MSAtNDEwLjMyOCw0MTAuMzEgMCwzMi4xNiAzLjYyOCw2My40OCAxMC42MjUsOTMuNTEgLTM0%0D%0AMS4wMTYsLTE3LjExIC02NDMuMzY4LC0xODAuNDcgLTg0NS43MzksLTQyOC43MiAtMzUuMzI0LDYw%0D%0ALjYgLTU1LjU1ODMsMTMxLjA5IC01NS41NTgzLDIwNi4yOSAwLDE0Mi4zNiA3Mi40MzczLDI2Ny45%0D%0ANSAxODIuNTQzMywzNDEuNTMgLTY3LjI2MiwtMi4xMyAtMTMwLjUzNSwtMjAuNTkgLTE4NS44NTE5%0D%0ALC01MS4zMiAtMC4wMzksMS43MSAtMC4wMzksMy40MiAtMC4wMzksNS4xNiAwLDE5OC44MDMgMTQx%0D%0ALjQ0MSwzNjQuNjM1IDMyOS4xNDUsNDAyLjM0MiAtMzQuNDI2LDkuMzc1IC03MC42NzYsMTQuMzk1%0D%0AIC0xMDguMDk4LDE0LjM5NSAtMjYuNDQxLDAgLTUyLjE0NSwtMi41NzggLTc3LjIwMywtNy4zNjQg%0D%0ANTIuMjE1LDE2My4wMDggMjAzLjc1LDI4MS42NDkgMzgzLjMwNCwyODQuOTQ2IC0xNDAuNDI5LDEx%0D%0AMC4wNjIgLTMxNy4zNTEsMTc1LjY2IC01MDkuNTk3MiwxNzUuNjYgLTMzLjEyMTEsMCAtNjUuNzg1%0D%0AMSwtMS45NDkgLTk3Ljg4MjgsLTUuNzM4IDE4MS41ODYsMTE2LjQxNzYgMzk3LjI3LDE4NC4zNTkg%0D%0ANjI4Ljk4OCwxODQuMzU5IDc1NC43MzIsMCAxMTY3LjQ2MiwtNjI1LjIzOCAxMTY3LjQ2MiwtMTE2%0D%0ANy40NyAwLC0xNy43OSAtMC40MSwtMzUuNDggLTEuMiwtNTMuMDggODAuMTc5OSwtNTcuODYgMTQ5%0D%0ALjczOTksLTEzMC4xMiAyMDQuNzQ5OSwtMjEyLjQxIgogICAgc3R5bGU9ImZpbGw6IzAwYWNlZCIv%0D%0APgo8L3N2Zz4K' height='16'> <b>{0}</b>: {1}",
        multiline = true,
        args = {"^4@" .. twtName .. " (#" .. player .. ")", string.sub(rawCommand, 4, string.len(rawCommand))}
    })
end, false)

-- Me command
RegisterCommand("me", function(source, args, rawCommand)
    local player = source
    local playerCoords = GetEntityCoords(GetPlayerPed(player))
    for k, _ in pairs(onlinePlayers) do
        local targetCoords = GetEntityCoords(GetPlayerPed(k))
        if (#(playerCoords - targetCoords) < 19.999) then
            local name = onlinePlayers[player].firstName .. " " .. onlinePlayers[player].lastName
            TriggerClientEvent("chat:addMessage", k, {
                color = {255, 0, 0},
                args = {"^*ME | ^0" .. name .. " (#" .. player .. ")", string.sub(rawCommand, 3, string.len(rawCommand))}
            })
        end 
    end
end, false)

-- OOC command event
RegisterCommand("ooc", function(source, args, rawCommand)
    local player = source
    TriggerClientEvent("chat:addMessage", -1, {
        color = {150, 150, 150},
        args = {"^*OOC | ^0" .. GetPlayerName(player) .. " (#" .. player .. ")", string.sub(rawCommand, 4, string.len(rawCommand))}
    })
end, false)

-- Darkweb command event
RegisterCommand("darkweb", function(source, args, rawCommand)
    local player = source
    TriggerClientEvent("chat:addMessage", -1, {
        color = {0, 0, 0},
        args = {"^*Dark web | ^0Anonymous (#" .. player .. ")", string.sub(rawCommand, 8, string.len(rawCommand))}
    })
end, false)

-- 911 command event
RegisterCommand("911", function(source, args, rawCommand)
    local player = source
    for k, v in pairs(onlinePlayers) do
        if v.department ~= "CIV" then
            local coords = GetEntityCoords(GetPlayerPed(player))
            TriggerClientEvent("911", k, coords, rawCommand)
        end
    end
end, false)
