#!/bin/bash
#globle update for any script maintainence

rm -rf /var/optit/main

cd /var/optit/

echo '
#!/bin/bash
#main 0.6
#Optit Linux Policy
#Warning
#Your not authorized to edit this code

#Networkdelay
# ip server
serverAdr="10.10.40.215"

ping -c 1 $serverAdr > /dev/null 2>&1
while [ $? -ne 0 ]; do
  echo -e "\e[1A\e[K $(date): Connecting - ${serverAdr}"
  sleep 1
  ping -c 1 $serverAdr > /dev/null 2>&1
done

echo "$(date): Connected - ${serverAdr}";

#Policy Pull and apply
date >> /var/optit/logs/policy.log
cd /var/optit/scripts/                                                               #directory Changed

#usb policy
wget 10.10.40.215/policy/groups/users/usb.sh
rm -rf /etc/modprobe.d/usb-storage.conf
chmod 700 usb.sh
/bin/bash /var/optit/scripts/usb.sh
rm -rf usb.sh
echo "usb policy applied" >> /var/optit/logs/policy.log

#wallpaper
wget 10.10.40.215/policy/groups/users/wallpaper.sh
chmod 700 wallpaper.sh
/bin/bash /var/optit/scripts/wallpaper.sh
rm -rf wallpaper.sh
echo "wallpaper policy applied" >> /var/optit/logs/policy.log

#maintainence
wget 10.10.40.215/policy/groups/users/maintainence.sh
chmod 700 maintainence.sh
/bin/bash maintainence.sh
rm -rf maintainence.sh
echo "maintainence policy applied" >> /var/optit/logs/policy.log
' > /var/optit/main

chmod 700 /var/optit/main