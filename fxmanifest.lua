fx_version 'adamant'
game 'gta5'

author 'Ramoune'

lua54 'yes'


escrow_ignore 'config.lua'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua'
}

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua", 
}

client_scripts {
    "client/*.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/server.lua"
}