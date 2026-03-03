--[[
    ████████╗ █████╗ ██████╗  ██████╗ ███████╗████████╗
       ██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝
       ██║   ███████║██████╔╝██║  ███╗█████╗     ██║   
       ██║   ██╔══██║██╔══██╗██║   ██║██╔══╝     ██║   
       ██║   ██║  ██║██║  ██║╚██████╔╝███████╗   ██║   
       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝   
    
    🐺 LXR Target - Advanced Interaction & Targeting System
    
    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════
    
    Server:      The Land of Wolves 🐺
    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    Store:       https://theluxempire.tebex.io
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    Framework Support:
    - LXR Core  (Primary)
    - RSG Core  (Primary)
    - VORP Core (Supported)
    - Standalone (Fallback)
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

fx_version 'cerulean'
game       'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name        'lxr-target'
author      'iBoss21 / The Lux Empire — wolves.land'
description 'Advanced interaction & targeting system for LXRCore | RedM | wolves.land'
version     '5.2.2'

ui_page 'html/index.html'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@lxr-core/client/locale.lua',
    'init.lua',
    'client.lua',
}

server_scripts {
    'server.lua',
}

files {
    'data/*.lua',
    'html/*.html',
    'html/css/*.css',
    'html/js/*.js'
}

lua54 'yes'

dependencies {
    'PolyZone',
    'lxr-core'
}

credits {
    'Original concept by BerkieB',
    'Development and optimization by the LXR Development Team'
}
