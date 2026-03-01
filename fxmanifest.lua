server_script '@Wolf-Block-Backdoor/firewall.lua'
server_script '@Wolf-Block-Backdoor/firewall.js'
fx_version 'cerulean'
game 'gta5'

author 'Royal Scripts'
description 'Royal Ads System'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.png'
}
