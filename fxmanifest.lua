fx_version 'cerulean'
game 'gta5'
author 'maku#5434'
description 'catching events from punishment resources and sending them to remote api'
version '0.1'

server_scripts {
    'configuration/sv-apikey.lua',
    'configuration/sv-enums.lua',

    'server/sv-require.lua',
    'server/sv-main.lua',
    'server/sv-comms.lua'
}
