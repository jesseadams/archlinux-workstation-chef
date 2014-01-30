name 'workstation'
description 'ArchLinux Workstation'

default_attributes(
  'archlinux' => {
    'packages' => [
      'alsa-lib',
      'alsa-utils',
      'awesome',
      'cups',
      'curl',
      'dnsutils',
      'feh',
      'galculator',
      'gimp',
      'htop',
      'iotop',
      'libreoffice',
      'mplayer',
      'ncdu',
      'nmap',
      'nvidia',
      'nvidia-utils',
      'percona-server',
      'rsync',
      'rxvt-unicode',
      'scrot',
      'slim',
      'slim-themes',
      'sqlite',
      'sudo',
      'vim',
      'virtualbox',
      'virtualbox-host-modules',
      'wget',
      'whois',
      'wireless_tools',
      'wpa_supplicant',
      'xf86-input-synaptics',
      'xorg-server',
      'xterm',
      'xscreensaver',
    ],

    'packages_aur' => [
    ]
  }
)
