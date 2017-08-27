#!/bin/bash

echo "#### Changing to home directory ####"
cd ~
clear
echo "#### Installing Sudo ####"
apt-get install sudo -y
echo "#### Adding Bitcoin PPA ####"
sudo apt-get install software-properties-common -y
clear
sudo add-apt-repository ppa:bitcoin/bitcoin
#sudo add-apt-repository ppa:ionomy/ioncoin
clear
echo "#### Updating Ubuntu/Debian ####"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get update -y
clear
echo "#### Installing Dependencies ####"
sudo apt-get install autoconf -y
sudo apt-get install autogen -y
sudo apt-get install automake -y
sudo apt-get install autotools-dev -y 
sudo apt-get install bsdmainutils -y
sudo apt-get install build-essential -y 
sudo apt-get install git -y
sudo apt-get install libboost-all-dev -y 
sudo apt-get install libboost-dev -y
sudo apt-get install libboost-filesystem-dev -y 
sudo apt-get install libboost-program-options-dev -y 
sudo apt-get install libboost-system-dev -y
sudo apt-get install libboost-thread-dev -y
sudo apt-get install libcrypto++-dev -y
sudo apt-get install libdb++-dev -y
sudo apt-get install libdb4.8-dev -y
sudo apt-get install libdb4.8++-dev -y
sudo apt-get install libevent-dev -y
sudo apt-get install libgmp3-dev -y
sudo apt-get install libgmp-dev -y
sudo apt-get install libprotobuf-dev -y 
sudo apt-get install libqrencode-dev -y
sudo apt-get install libqt4-dev -y
sudo apt-get install libqt5-dev -y
sudo apt-get install libqt5core5a -y
sudo apt-get install libqt5dbus5 -y
sudo apt-get install libqt5gui5 -y
sudo apt-get install libssl-dev -y
sudo apt-get install libtool -y
sudo apt-get install make -y
sudo apt-get install miniupnpc -y
sudo apt-get install pkg-config -y 
sudo apt-get install protobuf-compiler -y
sudo apt-get install qt5-default -y
sudo apt-get install qt5-qmake -y
sudo apt-get install qtbase5-dev-tools -y 
sudo apt-get install qttools5-dev -y
sudo apt-get install qttools5-dev-tools -y
sudo apt-get install libminiupnpc-dev -y
sudo apt-get install zip -y
clear
echo "#### Downloading ION-QT ####"
git clone https://github.com/ionomy/ion
clear
echo "#### Changing To The Ion-QT Directory ####"
cd ion/
clear
echo "#### Chevking for existing Ion-QT install ####"
echo " "
if [ -n "$(ls -A ~/.ionomy/wallet.dat)" ] && [ -n "$(ls -A ~/.ionomy/ion.conf)" ]
then
  clear
  echo "#### Backing up original ion wallet.dat & ion.conf ####"
  echo " "
  sudo cp -p -f -r ~/.ionomy/wallet.dat ~/.ionomy/wallet.dat.backup
  sudo cp -p -f -r ~/.ionomy/ion.conf ~/.ionomy/ion.conf.backup
  sudo mv ~/.ionomy/wallet.dat ~/.ioncoin/
  sudo mv ~/.ionomy/ion.conf ~/.ionomy/ioncoin.conf
  sudo mv ~/.ionomy/ioncoin.conf ~/.ioncoin/
  echo "#### Installing Ion-QT ####"
  echo " "
  cd ion
  ./autogen.sh
  ./configure --with-gui
  make
  sudo make install
elif [ -n "$(ls -A ~/.ion/wallet.dat)" ] && [ -n "$(ls -A ~/.ion/ion.conf)" ]
  then
  clear
  echo "#### Backing up & moving old ion wallet.dat & ion.conf ####"
  echo " "
  sudo cp -p -f -r ~/.ion/wallet.dat ~/.ion/wallet.dat.backup
  sudo cp -p -f -r ~/.ion/ion.conf ~/.ion/ion.conf.backup
  sudo mv ~/.ion/wallet.dat ~/.ioncoin/
  sudo mv ~/.ion/ion.conf ~/.ionomy/ioncoin.conf
  sudo mv ~/.ion/ion.conf ~/.ioncoin/
  echo "#### Installing Ion-QT ####"
  echo " "
  cd ion
  ./autogen.sh
  ./configure --with-gui
  make
  sudo make install
elif [ -n "$(ls -A ~/.ioncoin/wallet.dat)" ] && [ -n "$(ls -A ~/.ioncoin/ioncoin.conf)" ]
  then
  clear
  echo "#### Backing up old ion wallet.dat & ion.conf ####"
  echo " "
  sudo cp -p -f -r ~/.ioncoin/wallet.dat ~/.ioncoin/wallet.dat.backup
  sudo cp -p -f -r ~/.ioncoin/ion.conf ~/.ioncoin/ion.conf.backup
  echo "#### Installing Ion-QT ####"
  echo " "
  cd ion
  ./autogen.sh
  ./configure --with-gui
  make
  sudo make install
else
  clear
  echo "#### No Existing Wallet Found, Installing Ion-QT ####"
  echo " "
  cd ion
  ./autogen.sh
  ./configure --with-gui
  make
  sudo make install
  clear
  echo "#### Please set a username and password, the password should be long and random ####"
  echo "#### Ctrl + X, Y, Enter to save file and exit ####"
  echo " "
  read -p "#### Press any key when you are ready to continue ####"
  echo " "
  wget https://raw.githubusercontent.com/sk00t3r/linux-ion/rebase/ioncoin.conf -O ioncoin.conf
  nano ioncoin.conf
fi
clear
echo "#### Changing to /usr/local/bin ####"
echo " "
cd /usr/local/bin
echo "#### Starting Ion-QT ####"
echo " "
ion-qt&
#echo "#### Starting Ion-QT Wallet ####"
#sudo ./ionx-qt
