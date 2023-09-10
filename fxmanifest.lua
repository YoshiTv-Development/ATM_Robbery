fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'ATM_Robbery'
description 'ATM Robbery'
author 'YoshiTv'
version '1.0.0'
discord 'https://discord.gg/pGP37hb5rF'

shared_script {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/**.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}