#!/bin/bash

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
   echo "Run this script as a root user" 1>&2
   exit 1
fi


#delete if kali-list file already exist
rm -f /etc/apt/sources.list.d/kali.list
rm -f /etc/apt/preferences.d/kali.pref

#add repo and preference file
echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list
echo -e 'Package: *\nPin: release a=kali-rolling\nPin-Priority: 50' >> /etc/apt/preferences.d/kali.pref

#add kali keys
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

#add lazydist lazy script to /bin

wget -P /bin "url"

chmod +x /bin/lazydist