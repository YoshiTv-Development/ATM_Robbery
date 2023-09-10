Config = {}

Config.LogDiscord = {
    Webhooks = 'Webhooks Here',
    Title = "Server Name",
    Color = 8492048
}

function NotificaPolizia()
    exports["DISPATCH"]:SendDispatch("10-11")
end

Config.JobRichiesto = 'polizia'

Config.PoliceNecessaria = 3

Config.Icon = {
    accessatm = 'fa-solid fa-money-check-dollar', -- WebSite For Icon https://fontawesome.com/icons
}

Config.Atm = {
    modelli = {
        "prop_atm_01", -- WebSite For Prop https://gtahash.ru/
        "prop_atm_02", -- WebSite For Prop https://gtahash.ru/
        "prop_atm_03", -- WebSite For Prop https://gtahash.ru/
        "prop_fleeca_atm" -- WebSite For Prop https://gtahash.ru/
    },
}

Config.Item = {
    togliere = 'tablet',
    ricevere = 'BLACK_MONEY'
} 

Config.Progress =  {
    tempo = 20000, -- 120 Seconds = 120000, 180 Seconds = 180000, 200 Seconds = 200000
    posizione = 'middle' -- middle or bottom
} 

Config.QuantitaRicevere = math.random(10000, 20000)

Config.TempoAttesa = 600000 -- 10 Minutes

Config.Langs = {
    PrintF8 = "^0[Yoshi Development]^0 ha startato correttamente: "..GetCurrentResourceName(),
    oxtarget = 'Hackera ATM',
    progress = 'Hackerando ATM',
    successatm = 'Hai ricevuto i soldi della rapina ora scappa prima che arriva la Polizia!',
    policeerror = 'Non ci sono abbastanza poliziotti in servizio',
    erroratm = 'Non hai un tablet per derubare l\'ATM',
    skillCheck = 'Hai sbagliato riprova',
    waitrobbery = 'Questo ATM è già stato derubato ripassa tra 10 minuti',
}