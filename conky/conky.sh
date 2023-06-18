#! /bin/bash

sudo qbittorrent --no-splash &
conky -p 20 -c /etc/conky/conky-tm-clock.conf &
conky -p 21 -c /etc/conky/conky-bm-networking.conf &
conky -p 22 -c /etc/conky/conky-bml-wired.conf &
conky -p 23 -c /etc/conky/conky-bmr-wireless.conf &
conky -p 24 -c /etc/conky/conky-tl-hdd.conf &
conky -p 25 -c /etc/conky/conky-tr-sys.conf &
conky -p 26 -c /etc/conky/conky-bl-proc_cpu.conf &
conky -p 27 -c /etc/conky/conky-br-proc_mem.conf &
conky -p 28 -c /etc/conky/conky-mm-warning.conf &
sleep 30 ;
sudo java -jar /home/elaouby/JDownloader/JDownloader.jar -norestart