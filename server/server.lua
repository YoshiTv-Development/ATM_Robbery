LangS = {
    ["player"] = "``Player:`` ",
    ["id"] = "\n ``ServerId:`` ",
    ["discord"] = "\n ``Discord:`` ",
    ["tempo"] = "\n ``Alle ore:`` ",
    ["rapinato"] = "\n ``Ha Rapinato:`` ",
    ["moneys"] = "Soldi Sporchi"
}

RegisterServerEvent("atm", function(item)
    local soldiricevere = Config.QuantitaRicevere
    exports.ox_inventory:RemoveItem(source, Config.Item.togliere, 1, false, false)
    exports.ox_inventory:AddItem(source, Config.Item.ricevere, Config.QuantitaRicevere, false, false)
    atmlog(source, soldiricevere)
end)

ESX.RegisterServerCallback('police:disponibili', function(source, cb)
	local cops = 0
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == Config.JobRichiesto then
			cops = cops + 1
		end
	end
	cb(cops)
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    yoshi()
end)

function yoshi()
    print(Config.Langs.PrintF8)
end

function atmlog(source, soldiricevere)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gruppo = xPlayer.getGroup()
    local name = GetPlayerName(source)
    local now = os.date('%H:%M')
	local steam = "n/a"
    local discord = "n/a"
    local license = "n/a"
    for m, n in ipairs(GetPlayerIdentifiers(_source)) do
        if n:match("steam") then
           steam = n
        elseif n:match("discord") then
           discord = n:gsub("discord:", "")
        elseif n:match("license") then
           license = n
        end
     end
    PerformHttpRequest(Config.LogDiscord.Webhooks, function()
    end, "POST", json.encode({
        username = 'YoshiTv Developement Copyright 2023',
        embeds = {{
            author = {
                name = "[YoshiTv Development] Version 1.0",
                url = "https://discord.gg/udH3eUJ2EB",
            },
            title = Config.LogDiscord.Title,
            description = LangS.player..name..LangS.id..source..LangS.discord.."<@"..discord..">"..LangS.tempo..now..LangS.rapinato..soldiricevere.."$ "..LangS.moneys.."\n\n **YoshiTv Development - YoshiTv**",
            color = Config.LogDiscord.Color
        }}}),{["Content-Type"] = "application/json"})
end