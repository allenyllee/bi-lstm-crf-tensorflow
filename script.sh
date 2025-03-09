## code name ##
# 16.04 xenial
# 18.04 bionic
# 20.04 focal
###############
# 1. "lsb_release -a" get the distribution information
# 2. "grep" get the line contains "Codename"
# 3. "cut" get the second column of tab delimiter line
######
# to fix "No LSB modules are available." error
# install lsb-core
###
# Ubuntu Linux ，判斷 Linux版本資訊 與 解決 No LSB modules are available. 訊息 | 龍崗山上的倉鼠
# https://kanchengzxdfgcv.blogspot.com/2016/03/ubuntu-linux-no-lsb-modules-are.html
######
# get os version
CODENAME=$(lsb_release -a | grep "Codename" | cut -d$'\t' -f2)
echo $CODENAME

# Proprietary GPU Drivers : "Graphics Drivers" team
# https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
# add ppa repository
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get upgrade -y

# purge all previous version (--purge removes configuration files)
sudo apt-get remove --purge -y nvidia-*

# check if ubuntu version > 16.04, then retrive latest driver version
if [ $CODENAME == "xenial" ]
then
NVIDIA_VERSION=$(sudo apt-cache search ^nvidia-[0-9]{3}$ | sort | tail -n -1 | cut -d' ' -f1)
else
NVIDIA_VERSION=$(sudo apt-cache search ^nvidia-driver-[0-9]{3}$ | sort | tail -n -1 | cut -d' ' -f1)
fi

# install latest version
sudo apt-get install -y $NVIDIA_VERSION
