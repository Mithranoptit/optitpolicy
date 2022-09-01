#!/bin/bash
#Wallpaper
cd /var/optit/                                                                      #directory Changed
#wget https://optit.in/wp-content/uploads/2021/05/Tired-of-your-IT-services-we-have-got-you-covered1600x700.jpg
wget https://optit.in/wp-content/uploads/2020/10/our-vision-2.jpg
mv *.jpg /usr/share/backgrounds/warty-final-ubuntu.png
#gsettings get org.gnome.desktop.background picture-uri 'wallpaper.jpg'
echo "Wallpaper changed" >> /var/optit/logs/policy.log

