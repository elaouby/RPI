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
#sudo rpi-eeprom-update
#sudo rpi-eeprom-update -d -a
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
crontab -l | { cat; echo "0 6 * * * sudo apt update ; sudo apt full-upgrade -y ; sudo apt-get check ; sudo apt autoremove -y ; sudo apt-get autoclean ; sudo apt-get clean ; sudo find /tmp -type f -delete ; sudo reboot"; } | crontab -
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