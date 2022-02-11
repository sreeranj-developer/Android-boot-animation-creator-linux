#!/bin/sh
echo "building-deb.."
sleep 5s;
echo "compressing-data"
sleep 1s;
echo "checking-preinst"
cd build
cd DEBIAN
chmod +x preinst
cd ..
cd ..
sleep 1s;
echo "reading-control"
sleep 1s;
dpkg-deb --build build android-bootanimation-creator-V1.2.dev-linux.deb
sleep 1s;
echo "creating-md5sum"
md5sum *.deb > md5sums.txt
sleep 2s;
echo "build-finished!"
