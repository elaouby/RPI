#git clone https://elaouby@github.com/elaouby/RPI /home/admin/RPI ; cd /home/admin/RPI ; sudo bash ./rpi.sh -r -p -d -g
#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
while getopts "rpdg" option; do
case $option in
r)
xset s noblank
xset s off
xset -dpms
sudo raspi-config nonint do_wifi_country QA
sudo raspi-config nonint do_wifi_ssid_passphrase Elaouby-Hub amr919497
(echo 3578; echo 3578) | passwd admin
echo "deb [trusted=yes] https://downloads.plex.tv/repo/deb public main" >> /etc/apt/sources.list
echo "root	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%sudo	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo cp -r /home/admin/RPI/50-local.d /etc/polkit-1/localauthority
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FA3303E
sudo curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo curl http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo apt update
wget https://download.teamviewer.com/download/linux/teamviewer_arm64.deb
sudo mkdir -p /home/admin/JDownloader
wget -O /home/admin/JDownloader/JDownloader.jar http://installer.jdownloader.org/JDownloader.jar
sudo apt install apt-transport-https ntp raspi-config rpi-imager ufw xdotool vlc qbittorrent default-jre default-jdk samba git conky conky-all gparted ./teamviewer_arm64.deb smartmontools snapd -y
sudo java -jar /home/admin/JDownloader/JDownloader.jar
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo apt update
sudo rpi-update -y
sudo rpi-eeprom-update
sudo rpi-eeprom-update -d -a
sudo apt full-upgrade -y
echo "FallbackNTP=216.239.35.0 216.239.35.4" >> /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo ufw allow from 0.0.0.0/0 to any port 3389
sudo ufw allow from 0.0.0.0/0 to any port 548
sudo ufw allow from 0.0.0.0/0 to any port 427
sudo ufw allow from 0.0.0.0/0 to any port 4700
sudo ufw allow from 0.0.0.0/0 to any port 65090
sudo ufw allow from 0.0.0.0/0 to any app samba
(echo 3578; echo 3578) | smbpasswd -a -s admin
echo '[global]' > /etc/samba/smb.conf
echo '	workgroup = WORKGROUP' >> /etc/samba/smb.conf
echo '	security = user' >> /etc/samba/smb.conf
echo '	netbios name = elaouby-rpi' >> /etc/samba/smb.conf
echo '	wins support = yes' >> /etc/samba/smb.conf
echo '	min protocol = SMB2' >> /etc/samba/smb.conf
echo '	server role = standalone server' >> /etc/samba/smb.conf
echo '	obey pam restrictions = yes' >> /etc/samba/smb.conf
echo '	unix password sync = yes' >> /etc/samba/smb.conf
echo '	passwd program = /usr/bin/passwd %u' >> /etc/samba/smb.conf
echo '	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .' >> /etc/samba/smb.conf
echo '	pam password change = yes' >> /etc/samba/smb.conf
echo '	writable = yes' >> /etc/samba/smb.conf
echo '	read only = no' >> /etc/samba/smb.conf
echo '	create mask = 0777' >> /etc/samba/smb.conf
echo '	directory mask = 0777' >> /etc/samba/smb.conf
echo '	force create mode = 0777' >> /etc/samba/smb.conf
echo '	force directory mode = 0777' >> /etc/samba/smb.conf
echo '	browseable = yes' >> /etc/samba/smb.conf
echo '	follow symlinks = yes' >> /etc/samba/smb.conf
echo '	wide links = yes' >> /etc/samba/smb.conf
echo '	force user = root' >> /etc/samba/smb.conf
echo '	valid users = admin' >> /etc/samba/smb.conf
echo '	vfs objects = acl_xattr catia fruit streams_xattr' >> /etc/samba/smb.conf
echo '	fruit:aapl = yes' >> /etc/samba/smb.conf
echo '	fruit:model = TimeCapsule' >> /etc/samba/smb.conf
echo '	fruit:advertise_fullsync = true' >> /etc/samba/smb.conf
echo '	fruit:metadata = stream' >> /etc/samba/smb.conf
echo '	fruit:veto_appledouble = no' >> /etc/samba/smb.conf
echo '	fruit:wipe_intentionally_left_blank_rfork = yes' >> /etc/samba/smb.conf
echo '	fruit:delete_empty_adfiles = yes' >> /etc/samba/smb.conf
echo '[root]' >> /etc/samba/smb.conf
echo '	path=/' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
sudo sed -i -e '1 s,$, usbhid.mousepoll=8,' /boot/cmdline.txt
sudo zerotier-cli join 1c33c1ced0155eb6
sudo raspi-config nonint do_boot_splash 1
sudo raspi-config nonint do_blanking 1
sudo raspi-config nonint do_vnc 0
crontab -l | { cat; echo "@reboot sleep 15 ; sudo systemctl enable ssh ; sudo systemctl start ssh ; sudo systemctl enable raspi-config.service ; sudo systemctl start raspi-config.service ; sudo teamviewer --daemon start ; sudo systemctl enable teamviewerd.service ; sudo systemctl start teamviewerd.service ; systemctl enable smbd ; systemctl start smbd ; sudo systemctl enable vncserver-x11-serviced.service ; sudo systemctl start vncserver-x11-serviced.service"; } | crontab -
crontab -l | { cat; echo "#0 6 * * * sudo apt update ; sudo apt full-upgrade -y ; sudo apt-get check ; sudo apt autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean ; sudo find /tmp -type f -delete ; sudo reboot"; } | crontab -
sudo usermod -a -G adm,root,ssl-cert,sudo,gpio,lpadmin admin
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo mkdir -p /home/admin/.config/pcmanfm/LXDE-pi
sudo touch /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo '[*]' > /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_bg=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_shadow=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_fg=#E8E8E8' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_font=PibotoLt 12' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper=/usr/share/rpd-wallpaper/clouds.jpg' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper_mode=color' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_documents=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_trash=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_mounts=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mkdir -p /home/admin/.config/autostart
sudo cp /usr/share/applications/com.teamviewer.TeamViewer.desktop /home/admin/.config/autostart/com.teamviewer.TeamViewer.desktop
sudo touch /home/admin/.config/autostart/conky.desktop
echo '[Desktop Entry]' > /home/admin/.config/autostart/conky.desktop
echo 'Type=Application' >> /home/admin/.config/autostart/conky.desktop
echo 'Name=conky' >> /home/admin/.config/autostart/conky.desktop
echo 'Exec=/etc/conky/conky.sh' >> /home/admin/.config/autostart/conky.desktop
echo 'Hidden=false' >> /home/admin/.config/autostart/conky.desktop
echo 'NoDisplay=false' >> /home/admin/.config/autostart/conky.desktop
echo 'Terminal=false' >> /home/admin/.config/autostart/conky.desktop
sudo cp -r /home/admin/RPI/conky /etc
chmod +x /etc/conky/conky.sh
sudo rm /etc/conky/conky.conf
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi
sudo touch /home/admin/.config/lxpanel/LXDE-pi/config
echo '[Command]' > /home/admin/.config/lxpanel/LXDE-pi/config
echo 'Logout=lxde-pi-shutdown-helper' >> /home/admin/.config/lxpanel/LXDE-pi/config
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi/panels
sudo touch /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# lxpanel <profile> config file. Manually editing is not recommended.' > /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# Use preference dialog in lxpanel to adjust config when you can.' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Global {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  edge=top' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  align=left' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  margin=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  widthtype=percent' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  width=100' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  height=32' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  transparent=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  tintcolor=#000000' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  alpha=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  autohide=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  heightwhenhidden=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setdocktype=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setpartialstrut=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontcolor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontsize=12' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontcolor=#ffffff' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontsize=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  background=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  backgroundfile=/usr/share/lxpanel/images/background.png' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  iconsize=28' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  monitor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  point_at_menu=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=smenu' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    padding=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    image=start-here' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    system {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-shutdown' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=logout' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=launchbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=chromium-browser.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=pcmanfmsudo.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=lxterminal.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=8' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=taskbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  expand=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    tooltips=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconsOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ShowAllDesks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseMouseWheel=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseUrgencyHint=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    FlatButton=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    MaxTaskWidth=200' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    spacing=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    GroupedTasks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=tray' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=updater' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ejecter' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    AutoHide=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=bluetooth' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=netman' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dhcpcdui' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=volumepulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=micpulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dclock' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ClockFmt=%A, %e %B %Y %l:%M:%S %p' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    TooltipFmt=%A %x' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    BoldFont=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    CenterText=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ptbatt' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=magnifier' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
sudo touch /usr/share/applications/pcmanfmsudo.desktop
echo '[Desktop Entry]' > /usr/share/applications/pcmanfmsudo.desktop
echo 'Type=Application' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Icon=system-file-manager' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Name=File Manager PCManFM' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Exec=sudo pcmanfm -d /' >> /usr/share/applications/pcmanfmsudo.desktop
sudo dphys-swapfile swapoff
echo 'CONF_SWAPSIZE=16384' > /etc/dphys-swapfile
echo 'CONF_MAXSWAP=16384' >> /etc/dphys-swapfile
echo 'arm_freq=2200' >> /boot/config.txt
echo 'gpu_freq=750' >> /boot/config.txt
echo 'hdmi_force_hotplug=1' >> /boot/config.txt
echo 'hdmi_group=2' >> /boot/config.txt
echo 'hdmi_mode=82' >> /boot/config.txt
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
;;
p)
#curl https://download.argon40.com/argoneon.sh | bash
#(echo 1; echo 1; echo y; echo 1; echo 0) | argon-config #fan
#(echo 2; echo y; echo 2; echo y; echo 1) | argon-config #remote
#(echo 3; echo 1; echo 0) | argon-config #rtc
#(echo 5; echo 1; echo 1; echo 0) | argon-config #temp-unit
curl -L https://raw.githubusercontent.com/JeffCurless/argoneon/main/argoneon.sh | bash
(echo 1; echo y; echo 1; echo 1) | argon-config #IR
(echo 2; echo 1; echo 0) | argon-config #RTC
echo '[General]' > /etc/argoneon.conf
echo 'temperature = C' >> /etc/argoneon.conf
echo 'debug = N' >> /etc/argoneon.conf
echo '' >> /etc/argoneon.conf
echo '[OLED]' >> /etc/argoneon.conf
echo 'screenduration = 30' >> /etc/argoneon.conf
echo 'screensaver = 120' >> /etc/argoneon.conf
echo 'screenlist = cpu ram temp ip' >> /etc/argoneon.conf
echo 'enabled = Y' >> /etc/argoneon.conf
echo '' >> /etc/argoneon.conf
echo '[CPUFan]' >> /etc/argoneon.conf
echo '30.0 = 30' >> /etc/argoneon.conf
echo '40.0 = 50' >> /etc/argoneon.conf
echo '50.0 = 100' >> /etc/argoneon.conf
echo '' >> /etc/argoneon.conf
echo '[HDDFan]' >> /etc/argoneon.conf
echo '40.0 = 25' >> /etc/argoneon.conf
echo '44.0 = 30' >> /etc/argoneon.conf
echo '46.0 = 35' >> /etc/argoneon.conf
echo '48.0 = 40' >> /etc/argoneon.conf
echo '50.0 = 50' >> /etc/argoneon.conf
echo '52.0 = 55' >> /etc/argoneon.conf
echo '54.0 = 60' >> /etc/argoneon.conf
echo '60.0 = 100' >> /etc/argoneon.conf
xset s noblank
xset s off
xset -dpms
sudo raspi-config nonint do_hostname elaouby-pinas
sudo raspi-config nonint do_wifi_country QA
sudo raspi-config nonint do_wifi_ssid_passphrase Elaouby-Hub amr919497
(echo 3578; echo 3578) | passwd admin
echo "deb [trusted=yes] https://downloads.plex.tv/repo/deb public main" >> /etc/apt/sources.list
echo "root	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%sudo	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo mkdir -p /etc/systemd/system/plexmediaserver.service.d
sudo touch /etc/systemd/system/plexmediaserver.service.d/override.conf
echo '[Service]' > /etc/systemd/system/plexmediaserver.service.d/override.conf
echo 'Environment="PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/media/admin/Plex/"' >> /etc/systemd/system/plexmediaserver.service.d/override.conf
echo 'User=admin' >> /etc/systemd/system/plexmediaserver.service.d/override.conf
echo 'Group=admin' >> /etc/systemd/system/plexmediaserver.service.d/override.conf
echo 'UMask=0000' >> /etc/systemd/system/plexmediaserver.service.d/override.conf
sudo cp -r /home/admin/RPI/50-local.d /etc/polkit-1/localauthority
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FA3303E
sudo curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo curl http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo apt update
wget https://download.teamviewer.com/download/linux/teamviewer_arm64.deb
sudo mkdir -p /home/admin/JDownloader
wget -O /home/admin/JDownloader/JDownloader.jar http://installer.jdownloader.org/JDownloader.jar
sudo apt install apt-transport-https ntp raspi-config rpi-imager ufw xdotool vlc qbittorrent default-jre default-jdk samba git conky conky-all gparted ./teamviewer_arm64.deb smartmontools plexmediaserver snapd -y
sudo snap install tautulli
sudo java -jar /home/admin/JDownloader/JDownloader.jar
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo apt update
sudo rpi-update -y
sudo rpi-eeprom-update
sudo rpi-eeprom-update -d -a
sudo apt full-upgrade -y
echo "FallbackNTP=216.239.35.0 216.239.35.4" >> /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo ufw allow from 0.0.0.0/0 to any port 3389
sudo ufw allow from 0.0.0.0/0 to any port 548
sudo ufw allow from 0.0.0.0/0 to any port 427
sudo ufw allow from 0.0.0.0/0 to any port 4700
sudo ufw allow from 0.0.0.0/0 to any port 65090
sudo ufw allow from 0.0.0.0/0 to any port 32400
sudo ufw allow from 0.0.0.0/0 to any app samba
sudo mkdir -p -m777 /media/admin/Backup
sudo mkdir -p -m777 /media/admin/Plex
sudo mkdir -p -m777 /media/admin/320GB
sudo mkdir -p -m777 /media/admin/1TB
echo 'UUID=21f4e5e2-938c-4589-a335-4938eb37b815    /media/admin/Backup    ext4    defaults,nofail 0 0' >> /etc/fstab
echo 'UUID=3c9484f6-e5b5-43bb-b9c8-2e6c682e524a    /media/admin/Plex    ext4    defaults,nofail 0 0' >> /etc/fstab
echo 'UUID=eb8797ec-285c-4d72-bfd1-bc212945c323    /media/admin/320GB    ext4    defaults,nofail 0 0' >> /etc/fstab
echo 'UUID=145636a1-6d7c-4dd1-8d5d-02657a71950b    /media/admin/1TB    ext4    defaults,nofail 0 0' >> /etc/fstab
sudo mount -a
sudo mkdir -p -m777 /media/admin/Backup/Timemachine
(echo 3578; echo 3578) | smbpasswd -a -s admin
echo '[global]' > /etc/samba/smb.conf
echo '	workgroup = WORKGROUP' >> /etc/samba/smb.conf
echo '	security = user' >> /etc/samba/smb.conf
echo '	netbios name = elaouby-pinas' >> /etc/samba/smb.conf
echo '	wins support = yes' >> /etc/samba/smb.conf
echo '	min protocol = SMB2' >> /etc/samba/smb.conf
echo '	server role = standalone server' >> /etc/samba/smb.conf
echo '	obey pam restrictions = yes' >> /etc/samba/smb.conf
echo '	unix password sync = yes' >> /etc/samba/smb.conf
echo '	passwd program = /usr/bin/passwd %u' >> /etc/samba/smb.conf
echo '	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .' >> /etc/samba/smb.conf
echo '	pam password change = yes' >> /etc/samba/smb.conf
echo '	writable = yes' >> /etc/samba/smb.conf
echo '	read only = no' >> /etc/samba/smb.conf
echo '	create mask = 0777' >> /etc/samba/smb.conf
echo '	directory mask = 0777' >> /etc/samba/smb.conf
echo '	force create mode = 0777' >> /etc/samba/smb.conf
echo '	force directory mode = 0777' >> /etc/samba/smb.conf
echo '	browseable = yes' >> /etc/samba/smb.conf
echo '	follow symlinks = yes' >> /etc/samba/smb.conf
echo '	wide links = yes' >> /etc/samba/smb.conf
echo '	force user = root' >> /etc/samba/smb.conf
echo '	valid users = admin' >> /etc/samba/smb.conf
echo '	vfs objects = acl_xattr catia fruit streams_xattr' >> /etc/samba/smb.conf
echo '	fruit:aapl = yes' >> /etc/samba/smb.conf
echo '	fruit:model = TimeCapsule' >> /etc/samba/smb.conf
echo '	fruit:advertise_fullsync = true' >> /etc/samba/smb.conf
echo '	fruit:metadata = stream' >> /etc/samba/smb.conf
echo '	fruit:veto_appledouble = no' >> /etc/samba/smb.conf
echo '	fruit:wipe_intentionally_left_blank_rfork = yes' >> /etc/samba/smb.conf
echo '	fruit:delete_empty_adfiles = yes' >> /etc/samba/smb.conf
echo '[root]' >> /etc/samba/smb.conf
echo '	path=/' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
echo '[Plex]' >> /etc/samba/smb.conf
echo '	path=/media/admin/Plex' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
echo '[Backup]' >> /etc/samba/smb.conf
echo '	path=/media/admin/Backup' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
echo '[320GB]' >> /etc/samba/smb.conf
echo '	path=/media/admin/320GB' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
echo '[1TB]' >> /etc/samba/smb.conf
echo '	path=/media/admin/1TB' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
echo '[TimeMachine]' >> /etc/samba/smb.conf
echo '	path=/media/admin/Backup/Timemachine' >> /etc/samba/smb.conf
echo '	fruit:time machine = yes' >> /etc/samba/smb.conf
echo '	fruit:posix_rename = yes' >> /etc/samba/smb.conf
echo '	browseable = no' >> /etc/samba/smb.conf
echo '	durable handles = yes' >> /etc/samba/smb.conf
echo '	kernel oplocks = no' >> /etc/samba/smb.conf
echo '	kernel share modes = no' >> /etc/samba/smb.conf
echo '	posix locking = no' >> /etc/samba/smb.conf
echo '	inherit acls = yes' >> /etc/samba/smb.conf
echo '	fruit:locking = netatalk' >> /etc/samba/smb.conf
echo '	fruit:time machine max size = 1.5T' >> /etc/samba/smb.conf
echo '	fruit:nfs_aces = no' >> /etc/samba/smb.conf
echo '	inherit permissions = yes' >> /etc/samba/smb.conf
sudo sed -i -e '1 s,$, usbhid.mousepoll=8,' /boot/cmdline.txt
sudo zerotier-cli join 1c33c1ced0155eb6
sudo raspi-config nonint do_boot_splash 1
sudo raspi-config nonint do_blanking 1
sudo raspi-config nonint do_vnc 0
crontab -l | { cat; echo "@reboot sleep 15 ; sudo systemctl enable ssh ; sudo systemctl start ssh ; sudo systemctl enable raspi-config.service ; sudo systemctl start raspi-config.service ; sudo teamviewer --daemon start ; sudo systemctl enable teamviewerd.service ; sudo systemctl start teamviewerd.service ; systemctl enable smbd ; systemctl start smbd ; sudo systemctl enable vncserver-x11-serviced.service ; sudo systemctl start vncserver-x11-serviced.service ; sudo systemctl enable plexmediaserver.service ; sudo systemctl start plexmediaserver.service"; } | crontab -
crontab -l | { cat; echo "#0 6 * * * sudo apt update ; sudo apt full-upgrade -y ; sudo apt-get check ; sudo apt autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean ; sudo find /tmp -type f -delete ; sudo reboot"; } | crontab -
sudo usermod -a -G adm,root,ssl-cert,sudo,gpio,lpadmin admin
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo mkdir -p /home/admin/.config/pcmanfm/LXDE-pi
sudo touch /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo '[*]' > /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_bg=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_shadow=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_fg=#E8E8E8' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_font=PibotoLt 12' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper=/usr/share/rpd-wallpaper/clouds.jpg' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper_mode=color' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_documents=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_trash=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_mounts=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mkdir -p /home/admin/.config/autostart
sudo cp /usr/share/applications/com.teamviewer.TeamViewer.desktop /home/admin/.config/autostart/com.teamviewer.TeamViewer.desktop
sudo touch /home/admin/.config/autostart/conky.desktop
echo '[Desktop Entry]' > /home/admin/.config/autostart/conky.desktop
echo 'Type=Application' >> /home/admin/.config/autostart/conky.desktop
echo 'Name=conky' >> /home/admin/.config/autostart/conky.desktop
echo 'Exec=/etc/conky/conky.sh' >> /home/admin/.config/autostart/conky.desktop
echo 'Hidden=false' >> /home/admin/.config/autostart/conky.desktop
echo 'NoDisplay=false' >> /home/admin/.config/autostart/conky.desktop
echo 'Terminal=false' >> /home/admin/.config/autostart/conky.desktop
sudo cp -r /home/admin/RPI/conky /etc
chmod +x /etc/conky/conky.sh
sudo rm /etc/conky/conky.conf
echo '#! /bin/bash' > /etc/conky/conky.sh
echo '' >> /etc/conky/conky.sh
echo 'sudo qbittorrent --no-splash &' >> /etc/conky/conky.sh
echo 'conky -p 20 -c /etc/conky/conky-tm-clock-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 21 -c /etc/conky/conky-bm-networking-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 22 -c /etc/conky/conky-bml-wired-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 23 -c /etc/conky/conky-bmr-wireless-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 24 -c /etc/conky/conky-tl-hdd-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 25 -c /etc/conky/conky-tr-sys-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 26 -c /etc/conky/conky-bl-proc_cpu-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 27 -c /etc/conky/conky-br-proc_mem-nas.conf &' >> /etc/conky/conky.sh
echo 'conky -p 28 -c /etc/conky/conky-mm-warning-nas.conf &' >> /etc/conky/conky.sh
echo 'sleep 30 ;' >> /etc/conky/conky.sh
echo 'sudo java -jar /home/admin/JDownloader/JDownloader.jar -norestart' >> /etc/conky/conky.sh
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi
sudo touch /home/admin/.config/lxpanel/LXDE-pi/config
echo '[Command]' > /home/admin/.config/lxpanel/LXDE-pi/config
echo 'Logout=lxde-pi-shutdown-helper' >> /home/admin/.config/lxpanel/LXDE-pi/config
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi/panels
sudo touch /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# lxpanel <profile> config file. Manually editing is not recommended.' > /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# Use preference dialog in lxpanel to adjust config when you can.' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Global {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  edge=top' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  align=left' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  margin=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  widthtype=percent' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  width=100' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  height=32' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  transparent=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  tintcolor=#000000' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  alpha=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  autohide=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  heightwhenhidden=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setdocktype=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setpartialstrut=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontcolor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontsize=12' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontcolor=#ffffff' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontsize=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  background=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  backgroundfile=/usr/share/lxpanel/images/background.png' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  iconsize=28' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  monitor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  point_at_menu=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=smenu' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    padding=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    image=start-here' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    system {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-shutdown' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=logout' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=launchbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=chromium-browser.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=pcmanfmsudo.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=lxterminal.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=8' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=taskbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  expand=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    tooltips=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconsOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ShowAllDesks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseMouseWheel=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseUrgencyHint=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    FlatButton=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    MaxTaskWidth=200' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    spacing=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    GroupedTasks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=tray' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=updater' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ejecter' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    AutoHide=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=bluetooth' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=netman' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dhcpcdui' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=volumepulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=micpulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dclock' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ClockFmt=%A, %e %B %Y %l:%M:%S %p' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    TooltipFmt=%A %x' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    BoldFont=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    CenterText=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ptbatt' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=magnifier' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
sudo touch /usr/share/applications/pcmanfmsudo.desktop
echo '[Desktop Entry]' > /usr/share/applications/pcmanfmsudo.desktop
echo 'Type=Application' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Icon=system-file-manager' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Name=File Manager PCManFM' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Exec=sudo pcmanfm -d /' >> /usr/share/applications/pcmanfmsudo.desktop
sudo dphys-swapfile swapoff
echo 'CONF_SWAPSIZE=16384' > /etc/dphys-swapfile
echo 'CONF_MAXSWAP=16384' >> /etc/dphys-swapfile
echo 'arm_freq=2200' >> /boot/config.txt
echo 'gpu_freq=750' >> /boot/config.txt
echo 'hdmi_force_hotplug=1' >> /boot/config.txt
echo 'hdmi_group=2' >> /boot/config.txt
echo 'hdmi_mode=82' >> /boot/config.txt
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
;;
d)
#curl https://download.argon40.com/argon1.sh | bash
#(echo y; echo 1) | argonone-config
#(echo y; echo 1; echo 1) | argonone-ir
git clone https://gitlab.com/DarkElvenAngel/argononed.git
cd /home/admin/RPI/argononed
sudo ./install
sudo ./configure
sudo systemctl enable argononed
sudo systemctl start argononed
sudo systemctl restart argononed
sudo argonone-cli -a
sudo argonone-cli --temp0=1 --fan0=25 --temp1=40 --fan1=50 --temp2=45 --fan2=100 --commit
xset s noblank
xset s off
xset -dpms
sudo raspi-config nonint do_hostname elaouby-pidns
sudo raspi-config nonint do_wifi_country QA
sudo raspi-config nonint do_wifi_ssid_passphrase Elaouby-Hub amr919497
(echo 3578; echo 3578) | passwd admin
echo "root	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%sudo	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo cp -r /home/admin/RPI/50-local.d /etc/polkit-1/localauthority
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FA3303E
sudo curl http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo apt update
wget https://download.teamviewer.com/download/linux/teamviewer_arm64.deb
sudo apt install apt-transport-https ntp raspi-config rpi-imager ufw xdotool default-jre default-jdk samba git conky conky-all gparted ./teamviewer_arm64.deb smartmontools snapd -y
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo apt update
sudo rpi-update -y
sudo rpi-eeprom-update
sudo rpi-eeprom-update -d -a
sudo apt full-upgrade -y
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo "FallbackNTP=216.239.35.0 216.239.35.4" >> /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo ufw allow from 0.0.0.0/0 to any port 3389
sudo ufw allow from 0.0.0.0/0 to any port 548
sudo ufw allow from 0.0.0.0/0 to any port 427
sudo ufw allow from 0.0.0.0/0 to any port 4700
sudo ufw allow from 0.0.0.0/0 to any port 65090
sudo ufw allow from 0.0.0.0/0 to any app samba
(echo 3578; echo 3578) | smbpasswd -a -s admin
echo '[global]' > /etc/samba/smb.conf
echo '	workgroup = WORKGROUP' >> /etc/samba/smb.conf
echo '	security = user' >> /etc/samba/smb.conf
echo '	netbios name = elaouby-pidns' >> /etc/samba/smb.conf
echo '	wins support = yes' >> /etc/samba/smb.conf
echo '	min protocol = SMB2' >> /etc/samba/smb.conf
echo '	server role = standalone server' >> /etc/samba/smb.conf
echo '	obey pam restrictions = yes' >> /etc/samba/smb.conf
echo '	unix password sync = yes' >> /etc/samba/smb.conf
echo '	passwd program = /usr/bin/passwd %u' >> /etc/samba/smb.conf
echo '	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .' >> /etc/samba/smb.conf
echo '	pam password change = yes' >> /etc/samba/smb.conf
echo '	writable = yes' >> /etc/samba/smb.conf
echo '	read only = no' >> /etc/samba/smb.conf
echo '	create mask = 0777' >> /etc/samba/smb.conf
echo '	directory mask = 0777' >> /etc/samba/smb.conf
echo '	force create mode = 0777' >> /etc/samba/smb.conf
echo '	force directory mode = 0777' >> /etc/samba/smb.conf
echo '	browseable = yes' >> /etc/samba/smb.conf
echo '	follow symlinks = yes' >> /etc/samba/smb.conf
echo '	wide links = yes' >> /etc/samba/smb.conf
echo '	force user = root' >> /etc/samba/smb.conf
echo '	valid users = admin' >> /etc/samba/smb.conf
echo '	vfs objects = acl_xattr catia fruit streams_xattr' >> /etc/samba/smb.conf
echo '	fruit:aapl = yes' >> /etc/samba/smb.conf
echo '	fruit:model = TimeCapsule' >> /etc/samba/smb.conf
echo '	fruit:advertise_fullsync = true' >> /etc/samba/smb.conf
echo '	fruit:metadata = stream' >> /etc/samba/smb.conf
echo '	fruit:veto_appledouble = no' >> /etc/samba/smb.conf
echo '	fruit:wipe_intentionally_left_blank_rfork = yes' >> /etc/samba/smb.conf
echo '	fruit:delete_empty_adfiles = yes' >> /etc/samba/smb.conf
echo '[root]' >> /etc/samba/smb.conf
echo '	path=/' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
sudo sed -i -e '1 s,$, usbhid.mousepoll=8,' /boot/cmdline.txt
sudo zerotier-cli join 1c33c1ced0155eb6
sudo raspi-config nonint do_boot_splash 1
sudo raspi-config nonint do_blanking 1
sudo raspi-config nonint do_vnc 0
crontab -l | { cat; echo "@reboot sleep 15 ; sudo systemctl enable argononed ; sudo systemctl start argononed ; sudo systemctl enable ssh ; sudo systemctl start ssh ; sudo systemctl enable raspi-config.service ; sudo systemctl start raspi-config.service ; sudo teamviewer --daemon start ; sudo systemctl enable teamviewerd.service ; sudo systemctl start teamviewerd.service ; systemctl enable smbd ; systemctl start smbd ; sudo systemctl enable vncserver-x11-serviced.service ; sudo systemctl start vncserver-x11-serviced.service ; sudo systemctl enable AdGuardHome.service ; sudo systemctl start AdGuardHome.service"; } | crontab -
crontab -l | { cat; echo "#0 6 * * * sudo apt update ; sudo apt full-upgrade -y ; sudo apt-get check ; sudo apt autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean ; sudo find /tmp -type f -delete ; sudo reboot"; } | crontab -
sudo usermod -a -G adm,root,ssl-cert,sudo,gpio,lpadmin admin
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo mkdir -p /home/admin/.config/pcmanfm/LXDE-pi
sudo touch /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo '[*]' > /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_bg=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_shadow=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_fg=#E8E8E8' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_font=PibotoLt 12' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper=/usr/share/rpd-wallpaper/clouds.jpg' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper_mode=color' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_documents=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_trash=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_mounts=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mkdir -p /home/admin/.config/autostart
sudo cp /usr/share/applications/com.teamviewer.TeamViewer.desktop /home/admin/.config/autostart/com.teamviewer.TeamViewer.desktop
sudo touch /home/admin/.config/autostart/conky.desktop
echo '[Desktop Entry]' > /home/admin/.config/autostart/conky.desktop
echo 'Type=Application' >> /home/admin/.config/autostart/conky.desktop
echo 'Name=conky' >> /home/admin/.config/autostart/conky.desktop
echo 'Exec=/etc/conky/conky.sh' >> /home/admin/.config/autostart/conky.desktop
echo 'Hidden=false' >> /home/admin/.config/autostart/conky.desktop
echo 'NoDisplay=false' >> /home/admin/.config/autostart/conky.desktop
echo 'Terminal=false' >> /home/admin/.config/autostart/conky.desktop
sudo cp -r /home/admin/RPI/conky /etc
chmod +x /etc/conky/conky.sh
sudo rm /etc/conky/conky.conf
echo '#! /bin/bash' > /etc/conky/conky.sh
echo '' >> /etc/conky/conky.sh
echo 'conky -p 20 -c /etc/conky/conky-tm-clock-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 21 -c /etc/conky/conky-bm-networking-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 22 -c /etc/conky/conky-bml-wired-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 23 -c /etc/conky/conky-bmr-wireless-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 24 -c /etc/conky/conky-tl-hdd-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 25 -c /etc/conky/conky-tr-sys-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 26 -c /etc/conky/conky-bl-proc_cpu-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 27 -c /etc/conky/conky-br-proc_mem-dns.conf &' >> /etc/conky/conky.sh
echo 'conky -p 28 -c /etc/conky/conky-mm-warning-dns.conf &' >> /etc/conky/conky.sh
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi
sudo touch /home/admin/.config/lxpanel/LXDE-pi/config
echo '[Command]' > /home/admin/.config/lxpanel/LXDE-pi/config
echo 'Logout=lxde-pi-shutdown-helper' >> /home/admin/.config/lxpanel/LXDE-pi/config
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi/panels
sudo touch /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# lxpanel <profile> config file. Manually editing is not recommended.' > /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# Use preference dialog in lxpanel to adjust config when you can.' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Global {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  edge=top' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  align=left' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  margin=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  widthtype=percent' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  width=100' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  height=32' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  transparent=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  tintcolor=#000000' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  alpha=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  autohide=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  heightwhenhidden=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setdocktype=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setpartialstrut=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontcolor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontsize=12' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontcolor=#ffffff' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontsize=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  background=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  backgroundfile=/usr/share/lxpanel/images/background.png' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  iconsize=28' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  monitor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  point_at_menu=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=smenu' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    padding=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    image=start-here' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    system {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-shutdown' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=logout' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=launchbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=chromium-browser.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=pcmanfmsudo.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=lxterminal.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=8' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=taskbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  expand=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    tooltips=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconsOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ShowAllDesks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseMouseWheel=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseUrgencyHint=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    FlatButton=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    MaxTaskWidth=200' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    spacing=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    GroupedTasks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=tray' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=updater' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ejecter' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    AutoHide=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=bluetooth' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=netman' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dhcpcdui' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=volumepulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=micpulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dclock' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ClockFmt=%A, %e %B %Y %l:%M:%S %p' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    TooltipFmt=%A %x' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    BoldFont=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    CenterText=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ptbatt' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=magnifier' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
sudo touch /usr/share/applications/pcmanfmsudo.desktop
echo '[Desktop Entry]' > /usr/share/applications/pcmanfmsudo.desktop
echo 'Type=Application' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Icon=system-file-manager' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Name=File Manager PCManFM' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Exec=sudo pcmanfm -d /' >> /usr/share/applications/pcmanfmsudo.desktop
cat <<EOT>> /opt/AdGuardHome/AdGuardHome.yaml
bind_host: 0.0.0.0
bind_port: 80
users:
  - name: elaouby
    password: \$2a\$10\$EfK7gXrYWc1GKQRZi.BuZO9W7YZAnLDBFWIwHtdQO7AEm.AUQrjpm
auth_attempts: 5
block_auth_min: 15
http_proxy: ""
language: ""
theme: auto
debug_pprof: false
web_session_ttl: 720
dns:
  bind_hosts:
    - 0.0.0.0
  port: 53
  anonymize_client_ip: false
  protection_enabled: true
  blocking_mode: default
  blocking_ipv4: ""
  blocking_ipv6: ""
  blocked_response_ttl: 10
  protection_disabled_until: null
  parental_block_host: family-block.dns.adguard.com
  safebrowsing_block_host: standard-block.dns.adguard.com
  ratelimit: 50
  ratelimit_whitelist: []
  refuse_any: true
  upstream_dns:
    - https://dns.google/dns-query
    - tls://dns.google
  upstream_dns_file: ""
  bootstrap_dns:
    - 9.9.9.10
    - 149.112.112.10
    - 2620:fe::10
    - 2620:fe::fe:10
  all_servers: false
  fastest_addr: false
  fastest_timeout: 1s
  allowed_clients: []
  disallowed_clients: []
  blocked_hosts:
    - version.bind
    - id.server
    - hostname.bind
  trusted_proxies:
    - 127.0.0.0/8
    - ::1/128
  cache_size: 4194304
  cache_ttl_min: 0
  cache_ttl_max: 0
  cache_optimistic: false
  bogus_nxdomain: []
  aaaa_disabled: false
  enable_dnssec: false
  edns_client_subnet:
    custom_ip: ""
    enabled: false
    use_custom: false
  max_goroutines: 300
  handle_ddr: true
  ipset: []
  ipset_file: ""
  bootstrap_prefer_ipv6: false
  filtering_enabled: true
  filters_update_interval: 24
  parental_enabled: true
  safebrowsing_enabled: true
  safebrowsing_cache_size: 1048576
  safesearch_cache_size: 1048576
  parental_cache_size: 1048576
  cache_time: 30
  safe_search:
    enabled: true
    bing: true
    duckduckgo: true
    google: true
    pixabay: true
    yandex: true
    youtube: true
  rewrites: []
  blocked_services: []
  upstream_timeout: 10s
  private_networks: []
  use_private_ptr_resolvers: true
  local_ptr_upstreams: []
  use_dns64: false
  dns64_prefixes: []
  serve_http3: false
  use_http3_upstreams: false
tls:
  enabled: false
  server_name: ""
  force_https: false
  port_https: 443
  port_dns_over_tls: 853
  port_dns_over_quic: 853
  port_dnscrypt: 0
  dnscrypt_config_file: ""
  allow_unencrypted_doh: false
  certificate_chain: ""
  private_key: ""
  certificate_path: ""
  private_key_path: ""
  strict_sni_check: false
querylog:
  ignored: []
  interval: 2160h
  size_memory: 1000
  enabled: true
  file_enabled: true
statistics:
  ignored: []
  interval: 2160h
  enabled: true
filters:
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt
    name: AdGuard DNS filter
    id: 1
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt
    name: AdAway Default Blocklist
    id: 2
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt
    name: Dan Pollock's List
    id: 1686759482
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt
    name: Steven Black's List
    id: 1686759483
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt
    name: Peter Lowe's Blocklist
    id: 1686759484
whitelist_filters: []
user_rules: []
dhcp:
  enabled: false
  interface_name: ""
  local_domain_name: lan
  dhcpv4:
    gateway_ip: ""
    subnet_mask: ""
    range_start: ""
    range_end: ""
    lease_duration: 86400
    icmp_timeout_msec: 1000
    options: []
  dhcpv6:
    range_start: ""
    lease_duration: 86400
    ra_slaac_only: false
    ra_allow_slaac: false
clients:
  runtime_sources:
    whois: true
    arp: true
    rdns: true
    dhcp: true
    hosts: true
  persistent:
    - safe_search:
        enabled: false
        bing: false
        duckduckgo: false
        google: false
        pixabay: false
        yandex: false
        youtube: false
      name: Elaouby
      tags: []
      ids:
        - 10.10.11.0/24
      blocked_services: []
      upstreams: []
      use_global_settings: false
      filtering_enabled: true
      parental_enabled: false
      safebrowsing_enabled: true
      use_global_blocked_services: true
      ignore_querylog: false
      ignore_statistics: false
log_file: ""
log_max_backups: 0
log_max_size: 100
log_max_age: 3
log_compress: false
log_localtime: false
verbose: false
os:
  group: ""
  user: ""
  rlimit_nofile: 0
schema_version: 20
EOT
sudo dphys-swapfile swapoff
echo 'CONF_SWAPSIZE=16384' > /etc/dphys-swapfile
echo 'CONF_MAXSWAP=16384' >> /etc/dphys-swapfile
#echo 'arm_freq=2200' >> /boot/config.txt
#echo 'gpu_freq=750' >> /boot/config.txt
echo 'hdmi_force_hotplug=1' >> /boot/config.txt
echo 'hdmi_group=2' >> /boot/config.txt
echo 'hdmi_mode=82' >> /boot/config.txt
echo 'dtoverlay=argonone,hysteresis=5' >> /boot/config.txt
echo 'dtparam=fantemp0=1' >> /boot/config.txt
echo 'dtparam=fantemp1=40' >> /boot/config.txt
echo 'dtparam=fantemp2=45' >> /boot/config.txt
echo 'dtparam=fanspeed0=25' >> /boot/config.txt
echo 'dtparam=fanspeed1=50' >> /boot/config.txt
echo 'dtparam=fanspeed2=100' >> /boot/config.txt
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
;;
g)
#curl https://download.argon40.com/argon1.sh | bash
#(echo y; echo 1) | argonone-config
#(echo y; echo 1; echo 1) | argonone-ir
git clone https://gitlab.com/DarkElvenAngel/argononed.git
cd /home/admin/RPI/argononed
sudo ./install
sudo ./configure
sudo systemctl enable argononed
sudo systemctl start argononed
sudo systemctl restart argononed
sudo argonone-cli -a
sudo argonone-cli --temp0=1 --fan0=25 --temp1=40 --fan1=50 --temp2=45 --fan2=100 --commit
xset s noblank
xset s off
xset -dpms
sudo raspi-config nonint do_hostname gcbk-pidns
(echo GcbK@2013!; echo GcbK@2013!) | passwd admin
echo "root	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "%sudo	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
echo "admin	ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo cp -r /home/admin/RPI/50-local.d /etc/polkit-1/localauthority
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FA3303E
sudo curl http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo apt update
wget https://download.teamviewer.com/download/linux/teamviewer_arm64.deb
sudo apt install apt-transport-https ntp raspi-config rpi-imager ufw xdotool conky conky-all default-jre default-jdk samba git gparted ./teamviewer_arm64.deb smartmontools snapd -y
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo apt update
sudo rpi-update -y
sudo rpi-eeprom-update
sudo rpi-eeprom-update -d -a
sudo apt full-upgrade -y
curl -s -S -L https://raw.githubusercontent.com/AdguardTeam/AdGuardHome/master/scripts/install.sh | sh -s -- -v
echo "FallbackNTP=216.239.35.0 216.239.35.4" >> /etc/systemd/timesyncd.conf
sudo timedatectl set-ntp true
sudo ufw allow from 0.0.0.0/0 to any port 3389
sudo ufw allow from 0.0.0.0/0 to any port 548
sudo ufw allow from 0.0.0.0/0 to any port 427
sudo ufw allow from 0.0.0.0/0 to any port 4700
sudo ufw allow from 0.0.0.0/0 to any port 65090
sudo ufw allow from 0.0.0.0/0 to any app samba
(echo GcbK@2013!; echo GcbK@2013!) | smbpasswd -a -s admin
echo '[global]' > /etc/samba/smb.conf
echo '	workgroup = WORKGROUP' >> /etc/samba/smb.conf
echo '	security = user' >> /etc/samba/smb.conf
echo '	netbios name = gcbk-pidns' >> /etc/samba/smb.conf
echo '	wins support = yes' >> /etc/samba/smb.conf
echo '	min protocol = SMB2' >> /etc/samba/smb.conf
echo '	server role = standalone server' >> /etc/samba/smb.conf
echo '	obey pam restrictions = yes' >> /etc/samba/smb.conf
echo '	unix password sync = yes' >> /etc/samba/smb.conf
echo '	passwd program = /usr/bin/passwd %u' >> /etc/samba/smb.conf
echo '	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .' >> /etc/samba/smb.conf
echo '	pam password change = yes' >> /etc/samba/smb.conf
echo '	writable = yes' >> /etc/samba/smb.conf
echo '	read only = no' >> /etc/samba/smb.conf
echo '	create mask = 0777' >> /etc/samba/smb.conf
echo '	directory mask = 0777' >> /etc/samba/smb.conf
echo '	force create mode = 0777' >> /etc/samba/smb.conf
echo '	force directory mode = 0777' >> /etc/samba/smb.conf
echo '	browseable = yes' >> /etc/samba/smb.conf
echo '	follow symlinks = yes' >> /etc/samba/smb.conf
echo '	wide links = yes' >> /etc/samba/smb.conf
echo '	force user = root' >> /etc/samba/smb.conf
echo '	valid users = admin' >> /etc/samba/smb.conf
echo '	vfs objects = acl_xattr catia fruit streams_xattr' >> /etc/samba/smb.conf
echo '	fruit:aapl = yes' >> /etc/samba/smb.conf
echo '	fruit:model = TimeCapsule' >> /etc/samba/smb.conf
echo '	fruit:advertise_fullsync = true' >> /etc/samba/smb.conf
echo '	fruit:metadata = stream' >> /etc/samba/smb.conf
echo '	fruit:veto_appledouble = no' >> /etc/samba/smb.conf
echo '	fruit:wipe_intentionally_left_blank_rfork = yes' >> /etc/samba/smb.conf
echo '	fruit:delete_empty_adfiles = yes' >> /etc/samba/smb.conf
echo '[root]' >> /etc/samba/smb.conf
echo '	path=/' >> /etc/samba/smb.conf
echo '	spotlight backend = elasticsearch' >> /etc/samba/smb.conf
sudo sed -i -e '1 s,$, usbhid.mousepoll=8,' /boot/cmdline.txt
sudo zerotier-cli join 1c33c1ced0155eb6
sudo raspi-config nonint do_wifi_country QA
sudo raspi-config nonint do_wifi_ssid_passphrase GCBK q@G_/:i_
sudo raspi-config nonint do_boot_splash 1
sudo raspi-config nonint do_blanking 1
sudo raspi-config nonint do_vnc 0
crontab -l | { cat; echo "@reboot sleep 15 ; sudo systemctl enable argononed ; sudo systemctl start argononed ; sudo systemctl enable ssh ; sudo systemctl start ssh ; sudo systemctl enable raspi-config.service ; sudo systemctl start raspi-config.service ; sudo teamviewer --daemon start ; sudo systemctl enable teamviewerd.service ; sudo systemctl start teamviewerd.service ; systemctl enable smbd ; systemctl start smbd ; sudo systemctl enable vncserver-x11-serviced.service ; sudo systemctl start vncserver-x11-serviced.service ; sudo systemctl enable AdGuardHome.service ; sudo systemctl start AdGuardHome.service"; } | crontab -
crontab -l | { cat; echo "#0 6 * * * sudo apt update ; sudo apt full-upgrade -y ; sudo apt-get check ; sudo apt autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean ; sudo find /tmp -type f -delete ; sudo reboot"; } | crontab -
sudo usermod -a -G adm,root,ssl-cert,sudo,gpio,lpadmin admin
sudo apt-get check
sudo apt autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo mkdir -p /home/admin/.config/pcmanfm/LXDE-pi
sudo touch /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo '[*]' > /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_bg=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_shadow=#000000' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_fg=#E8E8E8' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'desktop_font=PibotoLt 12' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper=/usr/share/rpd-wallpaper/clouds.jpg' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'wallpaper_mode=color' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_documents=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_trash=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
echo 'show_mounts=0' >> /home/admin/.config/pcmanfm/LXDE-pi/desktop-items-0.conf
sudo mkdir -p /home/admin/.config/autostart
sudo cp /usr/share/applications/com.teamviewer.TeamViewer.desktop /home/admin/.config/autostart/com.teamviewer.TeamViewer.desktop
sudo touch /home/admin/.config/autostart/conky.desktop
echo '[Desktop Entry]' > /home/admin/.config/autostart/conky.desktop
echo 'Type=Application' >> /home/admin/.config/autostart/conky.desktop
echo 'Name=conky' >> /home/admin/.config/autostart/conky.desktop
echo 'Exec=/etc/conky/conky.sh' >> /home/admin/.config/autostart/conky.desktop
echo 'Hidden=false' >> /home/admin/.config/autostart/conky.desktop
echo 'NoDisplay=false' >> /home/admin/.config/autostart/conky.desktop
echo 'Terminal=false' >> /home/admin/.config/autostart/conky.desktop
sudo cp -r /home/admin/RPI/conky /etc
chmod +x /etc/conky/conky.sh
sudo rm /etc/conky/conky.conf
echo '#! /bin/bash' > /etc/conky/conky.sh
echo '' >> /etc/conky/conky.sh
echo 'conky -p 20 -c /etc/conky/conky-tm-clock-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 21 -c /etc/conky/conky-bm-networking-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 22 -c /etc/conky/conky-bml-wired-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 23 -c /etc/conky/conky-bmr-wireless-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 24 -c /etc/conky/conky-tl-hdd-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 25 -c /etc/conky/conky-tr-sys-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 26 -c /etc/conky/conky-bl-proc_cpu-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 27 -c /etc/conky/conky-br-proc_mem-gcbk.conf &' >> /etc/conky/conky.sh
echo 'conky -p 28 -c /etc/conky/conky-mm-warning-gcbk.conf &' >> /etc/conky/conky.sh
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi
sudo touch /home/admin/.config/lxpanel/LXDE-pi/config
echo '[Command]' > /home/admin/.config/lxpanel/LXDE-pi/config
echo 'Logout=lxde-pi-shutdown-helper' >> /home/admin/.config/lxpanel/LXDE-pi/config
sudo mkdir -p /home/admin/.config/lxpanel/LXDE-pi/panels
sudo touch /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# lxpanel <profile> config file. Manually editing is not recommended.' > /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '# Use preference dialog in lxpanel to adjust config when you can.' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Global {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  edge=top' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  align=left' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  margin=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  widthtype=percent' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  width=100' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  height=32' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  transparent=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  tintcolor=#000000' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  alpha=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  autohide=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  heightwhenhidden=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setdocktype=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  setpartialstrut=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontcolor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontsize=12' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  fontcolor=#ffffff' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  usefontsize=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  background=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  backgroundfile=/usr/share/lxpanel/images/background.png' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  iconsize=28' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  monitor=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  point_at_menu=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=smenu' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    padding=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    image=start-here' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    system {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=run' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    separator {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    item {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      image=system-shutdown' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      command=logout' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=4' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=launchbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=chromium-browser.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=pcmanfmsudo.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Button {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '      id=lxterminal.desktop' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=8' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=taskbar' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  expand=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    tooltips=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconsOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ShowAllDesks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseMouseWheel=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    UseUrgencyHint=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    FlatButton=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    MaxTaskWidth=200' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    spacing=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    GroupedTasks=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=tray' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=updater' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ejecter' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    AutoHide=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=bluetooth' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=netman' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dhcpcdui' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=volumepulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=micpulse' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=dclock' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    ClockFmt=%A, %e %B %Y %l:%M:%S %p' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    TooltipFmt=%A %x' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    BoldFont=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    IconOnly=0' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    CenterText=1' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=ptbatt' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=space' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '    Size=2' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo 'Plugin {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  type=magnifier' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  Config {' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '  }' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '}' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
echo '' >> /home/admin/.config/lxpanel/LXDE-pi/panels/panel
sudo touch /usr/share/applications/pcmanfmsudo.desktop
echo '[Desktop Entry]' > /usr/share/applications/pcmanfmsudo.desktop
echo 'Type=Application' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Icon=system-file-manager' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Name=File Manager PCManFM' >> /usr/share/applications/pcmanfmsudo.desktop
echo 'Exec=sudo pcmanfm -d /' >> /usr/share/applications/pcmanfmsudo.desktop
cat <<EOT>> /opt/AdGuardHome/AdGuardHome.yaml
bind_host: 0.0.0.0
bind_port: 80
users:
  - name: admin
    password: \$2a\$10\$iLx7pRxHoB2Sd5Z/PZ./TuvfF2TEE02oyVdBelY/hwoFqa44Y1z1C
auth_attempts: 5
block_auth_min: 15
http_proxy: ""
language: ""
theme: auto
debug_pprof: false
web_session_ttl: 720
dns:
  bind_hosts:
    - 0.0.0.0
  port: 53
  anonymize_client_ip: false
  protection_enabled: true
  blocking_mode: default
  blocking_ipv4: ""
  blocking_ipv6: ""
  blocked_response_ttl: 10
  protection_disabled_until: null
  parental_block_host: family-block.dns.adguard.com
  safebrowsing_block_host: standard-block.dns.adguard.com
  ratelimit: 20
  ratelimit_whitelist: []
  refuse_any: true
  upstream_dns:
    - https://dns.google/dns-query
    - tls://dns.google
  upstream_dns_file: ""
  bootstrap_dns:
    - 9.9.9.10
    - 149.112.112.10
    - 2620:fe::10
    - 2620:fe::fe:10
  all_servers: false
  fastest_addr: false
  fastest_timeout: 1s
  allowed_clients: []
  disallowed_clients: []
  blocked_hosts:
    - version.bind
    - id.server
    - hostname.bind
  trusted_proxies:
    - 127.0.0.0/8
    - ::1/128
  cache_size: 4194304
  cache_ttl_min: 0
  cache_ttl_max: 0
  cache_optimistic: false
  bogus_nxdomain: []
  aaaa_disabled: false
  enable_dnssec: false
  edns_client_subnet:
    custom_ip: ""
    enabled: false
    use_custom: false
  max_goroutines: 300
  handle_ddr: true
  ipset: []
  ipset_file: ""
  bootstrap_prefer_ipv6: false
  filtering_enabled: true
  filters_update_interval: 24
  parental_enabled: true
  safebrowsing_enabled: true
  safebrowsing_cache_size: 1048576
  safesearch_cache_size: 1048576
  parental_cache_size: 1048576
  cache_time: 30
  safe_search:
    enabled: true
    bing: true
    duckduckgo: true
    google: true
    pixabay: true
    yandex: true
    youtube: true
  rewrites: []
  blocked_services: []
  upstream_timeout: 10s
  private_networks: []
  use_private_ptr_resolvers: true
  local_ptr_upstreams: []
  use_dns64: false
  dns64_prefixes: []
  serve_http3: false
  use_http3_upstreams: false
tls:
  enabled: false
  server_name: ""
  force_https: false
  port_https: 443
  port_dns_over_tls: 853
  port_dns_over_quic: 853
  port_dnscrypt: 0
  dnscrypt_config_file: ""
  allow_unencrypted_doh: false
  certificate_chain: ""
  private_key: ""
  certificate_path: ""
  private_key_path: ""
  strict_sni_check: false
querylog:
  ignored: []
  interval: 2160h
  size_memory: 1000
  enabled: true
  file_enabled: true
statistics:
  ignored: []
  interval: 2160h
  enabled: true
filters:
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt
    name: AdGuard DNS filter
    id: 1
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt
    name: AdAway Default Blocklist
    id: 2
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt
    name: Dan Pollock's List
    id: 1686871887
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt
    name: Peter Lowe's Blocklist
    id: 1686871888
  - enabled: true
    url: https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt
    name: Steven Black's List
    id: 1686871889
whitelist_filters: []
user_rules: []
dhcp:
  enabled: false
  interface_name: ""
  local_domain_name: lan
  dhcpv4:
    gateway_ip: ""
    subnet_mask: ""
    range_start: ""
    range_end: ""
    lease_duration: 86400
    icmp_timeout_msec: 1000
    options: []
  dhcpv6:
    range_start: ""
    lease_duration: 86400
    ra_slaac_only: false
    ra_allow_slaac: false
clients:
  runtime_sources:
    whois: true
    arp: true
    rdns: true
    dhcp: true
    hosts: true
  persistent:
    - safe_search:
        enabled: false
        bing: false
        duckduckgo: false
        google: false
        pixabay: false
        yandex: false
        youtube: false
      name: Elaouby
      tags: []
      ids:
        - 10.20.9.0/23
      blocked_services: []
      upstreams: []
      use_global_settings: false
      filtering_enabled: true
      parental_enabled: false
      safebrowsing_enabled: true
      use_global_blocked_services: true
      ignore_querylog: false
      ignore_statistics: false
    - safe_search:
        enabled: true
        bing: true
        duckduckgo: true
        google: true
        pixabay: true
        yandex: true
        youtube: true
      name: Management
      tags: []
      ids:
        - 10.20.10.0/24
      blocked_services: []
      upstreams: []
      use_global_settings: true
      filtering_enabled: false
      parental_enabled: false
      safebrowsing_enabled: false
      use_global_blocked_services: true
      ignore_querylog: false
      ignore_statistics: false
log_file: ""
log_max_backups: 0
log_max_size: 100
log_max_age: 3
log_compress: false
log_localtime: false
verbose: false
os:
  group: ""
  user: ""
  rlimit_nofile: 0
schema_version: 20
EOT
sudo dphys-swapfile swapoff
echo 'CONF_SWAPSIZE=16384' > /etc/dphys-swapfile
echo 'CONF_MAXSWAP=16384' >> /etc/dphys-swapfile
#echo 'arm_freq=2200' >> /boot/config.txt
#echo 'gpu_freq=750' >> /boot/config.txt
echo 'hdmi_force_hotplug=1' >> /boot/config.txt
echo 'hdmi_group=2' >> /boot/config.txt
echo 'hdmi_mode=82' >> /boot/config.txt
echo 'dtoverlay=argonone,hysteresis=5' >> /boot/config.txt
echo 'dtparam=fantemp0=1' >> /boot/config.txt
echo 'dtparam=fantemp1=40' >> /boot/config.txt
echo 'dtparam=fantemp2=45' >> /boot/config.txt
echo 'dtparam=fanspeed0=25' >> /boot/config.txt
echo 'dtparam=fanspeed1=50' >> /boot/config.txt
echo 'dtparam=fanspeed2=100' >> /boot/config.txt
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
;;
*) # Display help.
echo "Choose option -r -p -d -g"
;;
esac
done
sudo find /tmp -type f -delete
sudo rm -r /home/admin/RPI
echo "Done"
echo "Rebooting in 5s..."
sleep 5
sudo reboot
