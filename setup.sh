#!usr/bin/env bash

sudo timedatectl set-ntp false
echo "input date YYYY-MM-DD HH:MM:SS"
read date
sudo timedatectl set-time $date

sudo apt update 

wget https://raw.githubusercontent.com/joke2512/trustzone-setup/main/prereq.sh

sudo chmod +x prereq.sh

./prereq.sh
