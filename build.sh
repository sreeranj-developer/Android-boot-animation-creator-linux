

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
echo "checking-version"
while IFS= read -r line; do
  if [[ "$line" == *"V"* ]]; then
    printf '%s\n' "$line"
    sleep 1s;
    echo "creating-deb"
    echo "need superuser-grant"
    sudo dpkg-deb --build build android-bootanimation-creator-$line-linux.deb
  fi
done < "version-control.txt"
sleep 1s;
echo "creating-md5sum"
md5sum *.deb > md5sums.txt
sleep 2s;
echo "build-finished!"
sleep 2s;
echo "Do you wish to install this program?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo dpkg -i *.deb; break;;
        No ) exit;;
    esac
done

