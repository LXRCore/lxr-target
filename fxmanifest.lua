fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'BerkieB & LXR Development Team'
description 'An optimized interaction system for LXRCore, based on qtarget'
version '5.2.2'

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
