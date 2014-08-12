#!/bin/bash
#Author: Christian Eissler
#Last change: 11.08.14

#Description:
#Build a Yocto based image with Wayland, Qt, QtWayland plugin,Graphic support, QtWebkit, (Accelerated HTML5)#

##########################################################################################################
echo Install development tools

export PROJECT_DIR=$PWD
export SOURCE_DIR=$PROJECT_DIR"/src"
export CONFIGURATION_DIR=$PROJECT_DIR"/configuration_files"
export BUILD_DIR=$PROJECT_DIR"/build"
export TEMP_DIR=$PROJECT_DIR"/temp"
export SCRIPT_DIR=$PROJECT_DIR"/scripts"

export yocto_branch=daisy
export create_Qt_SDK=false

#Check the script parameters
for i in "$@"
do
    case $i in
        --create_Qt_SDK)
            create_Qt_SDK=true
        ;;
         --yocto_branch=*)
            yocto_branch=`echo $i | cut -d '=' -f 2`
        ;;
    esac

done


mkdir temp
mkdir build/images

#Install build tools on the Host system
sudo apt-get install build-essential git autoconf automake libtool nfs-kernel-server lzop


PATH=$PATH:$PROJECT_DIR/tools
#Install the repo application if not available
if [ ! -f $PROJECT_DIR/tools/repo ]; then 

	mkdir $PROJECT_DIR/tools
	curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > $PROJECT_DIR/tools/repo
	chmod a+x $PROJECT_DIR/tools/repo

fi

########################Creating Yocto Build with Qt Integration########################################
echo Creating Yocto Build with Qt Integratio

cd src
mkdir yocto
cd yocto

#Creating the yocto repo
repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b $yocto_branch
repo sync

#Creating the meta Qt5 repository
cd sources
git clone -b $yocto_branch https://github.com/meta-qt5/meta-qt5.git
cd ..

#Copy the yocto configuration
cp $CONFIGURATION_DIR/local.conf build/conf/
cp $CONFIGURATION_DIR/bblayers.conf build/conf/

#Configure the yocto build
MACHINE=nitrogen6x ./setup-environment build

#Building the image(Takes long time)
bitbake core-image-weston

#Copy image to build folder:
cp tmp/deploy/images/nitrogen6x/core-image-weston-nitrogen6x.sdcard $BUILD_DIR"/images"


#Mount the image
mount_dir=/mnt/weston_mount
sudo mkdir $mount_dir

export offset_image="$(sudo $SCRIPT_DIR/mount_Image.sh $BUILD_DIR/images/core-image-weston-nitrogen6x.rootfs.sdcard | sed -n 2p)"

sudo mount core-image-weston-nitrogen6x.rootfs.sdcard $mount_dir -o offset=offset_image

sudo cp -r $CONFIGURATION_DIR/sysroot_binary_packages/qtwebkit-examples/image/* $mount_dir
sudo cp -r $CONFIGURATION_DIR/sysroot_binary_packages/qtwebkit-examples/image/* $mount_dir

sudo umount $mount_dir



################################IMX6 Qt SDK install###########################################################
 if [ $create_Qt_SDK ]; then   

	echo Build the Qt SDK

	#Build the Qt SDK
	bitbake meta-toolchain-qt5
	sudo ./tmp/deploy/sdk/poky-eglibc-i686-meta-toolchain-qt5-cortexa9hf-vfp-neon-toolchain-1.6.1.sh

fi

###############################################################################################################










