#!/bin/bash

### get root directory install ###
echo ''
echo '-----------------------------------------------------------------'
echo 'please ensure that all dependencies are installed!'
echo 'install dependencies using command "sudo bash ./<distro_name>.sh"'
echo 'yosys installed as dependencies :('
echo '-----------------------------------------------------------------'
echo ''


read -p "install directory (under /home/$SUDO_USER): " rootd

dir='/home/'$SUDO_USER'/'$rootd'/digital_flow'

echo ''
echo "install dir: "$dir
echo ''

### check if directory exists ###
if [ ! -d "/home/$SUDO_USER/$rootd" ]; then

    echo '/home/'$SUDO_USER/$rootd' not found!!!'
    echo 'creating ...'
    mkdir '/home/'$SUDO_USER'/'$rootd
    mkdir $dir

else
    echo 'dir /home/'$SUDO_USER/$rootd' exists!'

    if [ ! -d "$dir" ]; then

        echo 'dir '$dir' not found!!!'
        echo 'creating ...'
        mkdir $dir

    else

        echo 'target dir '$dir' exists!'

    fi

fi

cd $dir

### install magic ###
echo ''
echo 'installing magic vlsi ...'
git clone https://github.com/RTimothyEdwards/magic.git
cd magic
git checkout magic-8.3
./configure
make
make install
echo ''
echo 'magic vlsi install finished :)'

### install graywolf ###
echo ''
echo 'installing graywolf synthesiser ...'
cd $dir
git clone https://github.com/rubund/graywolf.git
cd graywolf
mkdir build && cd build
cmake ..
make
make install
echo ''
echo 'grywolf synthesiser install finished :)'

### install qrouter ###
echo ''
echo 'installing qrouter auto routing tool ...'
cd $dir
git clone https://github.com/RTimothyEdwards/qrouter.git
cd qrouter
./configure
make
make install
echo ''
echo 'qrouter auto routing tool install finished :)'

### install netgen ###
echo ''
echo 'installing netgen netlist generator ...'
cd $dir
git clone https://github.com/RTimothyEdwards/netgen.git
cd netgen
./configure
make
make install
echo ''
echo 'netgen netlist generator install finished :)'

### install qrouter ###
echo ''
echo 'installing qrouter apr tool ...'
cd $dir
git clone https://github.com/RTimothyEdwards/qflow.git
cd qflow
./configure
make
make install
echo ''
echo 'qrouter apr install finished :)'
