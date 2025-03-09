# Installing CUDA 10.1 on Ubuntu 20.04 | by Stephen Gregory | Medium
# https://medium.com/@stephengregory_69986/installing-cuda-10-1-on-ubuntu-20-04-e562a5e724a0
# CUDA 10.0 installation on Ubuntu 20.04 or 18.04 for StyleGAN2 – Page 2 – Beeren Sahu
# https://beerensahu.wordpress.com/2020/09/28/cuda-10-0-installation-on-ubuntu-20-04-or-18-04-for-stylegan2/2/

# add PPA
# Explore and play around for different OS and cuda versions:
# http://developer.download.nvidia.com/compute/cuda/repos
sudo add-apt-repository ppa:graphics-drivers
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

# add to source list
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

# install cuda 10.0
sudo apt update
sudo apt install cuda-10-0
sudo apt install libcudnn7
