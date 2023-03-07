# https://optee.readthedocs.io/en/latest/building/gits/build.html#get-and-build-the-solution


# step 1
mkdir -p trustzone
cd trustzone

# set system time and date 
# sudo timedatectl set-ntp false
# echo "input date YYYY-MM-DD"
# read date
# echo "input date HH:MM:SS"
# read time
# sudo timedatectl set-time $date
# sudo timedatectl set-time $time

# update apt 
sudo apt update 

# download and install prerequisites
wget https://raw.githubusercontent.com/joke2512/trustzone-setup/main/prereq.sh
sudo chmod +x prereq.sh
./prereq.sh

# step 2
#install repo
sudo apt install repo -y

git config --global user.name Jon
git config --global user.email joke2512@gmail.com


# step 3
repo init -u https://github.com/OP-TEE/manifest.git -m rpi3.xml
repo sync -j4 --no-clone-bundle

# step 4
cd build
make -j2 toolchains

#step 5
make -j `nproc`