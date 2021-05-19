#!/bin/bash
export TERM=linux
export CIHOME=$PWD
export LD_LIBRARY_PATH=$CIHOME:$LD_LIBRARY_PATH
export PATH=$CIHOME:$PATH
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install bash wget curl unzip zip tar busybox vim nano git python qemu-system mingw-w64 nodejs python3 miredo miredo-server ntpdate -y
sudo ntpdate pool.ntp.org
wget https://dl.google.com/android/repository/android-ndk-r21b-linux-x86_64.zip -O $CIHOME/ndk.zip
unzip $CIHOME/ndk.zip
rm -rf $CIHOME/ndk.zip
export NDKHOME=$CIHOME/android-ndk-r21b
$NDKHOME/build/tools/make-standalone-toolchain.sh --install-dir=$CIHOME/android/arm --arch=arm --platform=android-28
$NDKHOME/build/tools/make-standalone-toolchain.sh --install-dir=$CIHOME/android/arm64 --arch=arm64 --platform=android-28
$NDKHOME/build/tools/make-standalone-toolchain.sh --install-dir=$CIHOME/android/x86 --arch=x86 --platform=android-28
$NDKHOME/build/tools/make-standalone-toolchain.sh --install-dir=$CIHOME/android/x86_64 --arch=x86_64 --platform=android-28
export PATH=$NDKHOME:$CIHOME/android/arm/bin:$CIHOME/android/arm64/bin:$CIHOME/android/x86/bin:$CIHOME/android/x86_64/bin:$PATH
wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -O $CIHOME/go.tar.gz
tar -zxf $CIHOME/go.tar.gz
rm -rf $CIHOME/go.tar.gz
export GOROOT=$CIHOME/go
mkdir -p $CIHOME/golang
export GOPATH=$CIHOME/golang
export PATH=$GOROOT/bin:$PATH
if [ "$ZIPPKG_URL" = "" ]
then
wget -U ZipPkg/1.0 https://filespan.kccpdt.ml/zippkg.php?f=githubci -O zippkg.zip
else
wget -U ZipPkg/1.0 $ZIPPKG_URL -O zippkg.zip
fi
unzip zippkg.zip
rm -rf zippkg.zip
chmod -R 0770 $CIHOME/*
export ZIPPKGHOME=$CIHOME
export LD_LIBRARY_PATH=$ZIPPKGHOME:$LD_LIBRARY_PATH
export PATH=$ZIPPKGHOME:$PATH
bash zippkginit.sh