local ped = PlayerPedId()
local success = false
local PlayerLavoro = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerLavoro = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerLavoro.job = job
end)

local options = {
    {
        name = 'ox:option1',
        event = 'deruba:atm',
        icon = Config.Icon.accessatm,
        label = Config.Langs.oxtarget
    },
}
for k, v in pairs(Config.Atm.modelli) do
    exports.ox_target:addModel(v, options)
end

RegisterNetEvent('deruba:atm', function()
    ESX.TriggerServerCallback('police:disponibili', function(policedisponibile)
        if not tempo then
            if policedisponibile >= Config.PoliceNecessaria then
                local tablet = exports.ox_inventory:Search('count', Config.Item.togliere)
                if tablet >= 1 then
                    local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'w', 'a', 'd'})
                    if success then
                        tempo = true
                        NotificaPolizia()
                        FreezeEntityPosition(ped, true)
                        if lib.progressCircle({
                            duration = Config.Progress.tempo,
                            label = Config.Langs.progress,
                            position = Config.Progress.posizione,
                            useWhileDead = false,
                            canCancel = true,
                            anim = {
                                dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
                                clip = 'idle_a'
                            },
                            prop = {
                                model = `prop_cs_tablet`,
                                pos = vec3(0.03, 0.03, 0.02),
                                rot = vec3(0.0, 0.0, -1.5)
                            },
                        }) then TriggerServerEvent('atm') end
                        ESX.ShowNotification(Config.Langs.successatm)
                        FreezeEntityPosition(ped, false)
                    else
                        ESX.ShowNotification(Config.Langs.skillCheck)
                    end
                else
                    ESX.ShowNotification(Config.Langs.erroratm)
                end
                Wait(Config.TempoAttesa)
                tempo = false
            else
                ESX.ShowNotification(Config.Langs.policeerror)
            end
        else
            ESX.ShowNotification(Config.Langs.waitrobbery)   
        end
    end)
end)