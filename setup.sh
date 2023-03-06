mkdir trustzone
cd trustzone

# set system time and date 
sudo timedatectl set-ntp false
echo "input date YYYY-MM-DD"
read date
echo "input date HH:MM:SS"
read time
sudo timedatectl set-time $date
sudo timedatectl set-time $time

# update apt 
sudo apt update 

# download and install prerequisites
wget https://raw.githubusercontent.com/joke2512/trustzone-setup/main/prereq.sh
sudo chmod +x prereq.sh
./prereq.sh

#install repo
sudo apt install repo

git config --global user.name Jon
git config --global user.email joke2512@gmail.com

repo init -u https://android.googlesource.com/platform/manifest -b master

repo sync -c -j8

make clobber