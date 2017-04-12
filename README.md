# Installing The TestNet IonQT Wallet On Linux.
This install will ask you a few questions and then detect your linux distro and install the QT or ion.d wallet if it is supported. If your distro is not suported do not worry, I am working on more distros all the time.

# Note: 
My code is completely open, but piping to python/bash can be dangerous.  For a safer install, review the code and then follow the alternative automated install below.

You may have to install curl. To install curl run the following:

sudo apt-get install curl -y

python <(curl "https://gist.githubusercontent.com/sk00t3r/85b8943d9834f60fd5ae0ef3d0a80f3b/raw/6a18513e774c4935d862853bb03fc41b39154311/installtestnet.py" -s -N)

# Alternative TestNet Automated Install:

cd /opt

sudo apt-get install git -y

sudo wget https://raw.githubusercontent.com/sk00t3r/linux-ion/testnet/installtestnet.py

sudo chmod 755 installtestnet.py

sudo ./installtestnet.py

Copy the ion.conf to the correct directory, (cd ~/.ionomy/) and edit the file to create a username and password.

# Raspberry Pi TestNet Install:

Minimum 8GB SD card is needed.

You need to expand your storage by running the following from terminal:

sudo raspi-config

Select option 1

# Stopping TestNet Iond:

If you install the iond service only use "sudo pkill -9 iond". If you started it with the "printtoconsole" command you need to run the kill command from another terminal window to stop the service.
