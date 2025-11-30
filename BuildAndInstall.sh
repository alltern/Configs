#!/bin/bash

### For use in DXVK-NVAPi: https://github.com/jp7677/dxvk-nvapi, put in the repo ###

if [ -z "$1" ]; then
  echo "Add wineprefix as an argument"
  exit
fi

WINEPREFIX=$1

DIR="$(cd "$(dirname "$0")" && pwd)"
cd $DIR

rm -rf ./builds/
./package-release.sh master ./builds/

cd ./builds/dxvk-nvapi-master/

cp ./x32/* $WINEPREFIX/drive_c/windows/syswow64/
cp ./x64/* $WINEPREFIX/drive_c/windows/system32/

cp ./layer/* ~/.local/share/vulkan/implicit_layer.d/
