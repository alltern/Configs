#!/bin/bash

### For use in DXVK-NVAPi: https://github.com/jp7677/dxvk-nvapi, put in the repo ###

git pull
git submodule init
git submodule update --recursive

if [ -z "$1" ]; then
  echo "Add wineprefix as an argument"
  exit
fi

export WINEPREFIX=$1


echo 'Initialize for the first time [y/N] '
read -r INIT
if [ $INIT = 'y' ] || [ $INIT = 'Y' ]; then
  echo 'Initializing'
  winetricks dotnet20 dotnet48 d3dcompiler_43 d3dcompiler_47 d3dx9 d3dx10 d3dx11_42 d3dx11_43 faudio vcrun2005 vcrun2008 vcrun2010 vcrun2012 vcrun2013 vcrun2015 quartz

  setup_dxvk install
  setup_vkd3d_proton install
fi

DIR="$(cd "$(dirname "$0")" && pwd)"
cd $DIR

rm -rf ./builds/
./package-release.sh master ./builds/

cd ./builds/dxvk-nvapi-master/

cp ./x32/* $WINEPREFIX/drive_c/windows/syswow64/
cp ./x64/* $WINEPREFIX/drive_c/windows/system32/

echo 'Installing Nvidia Wine Driver Libraries'

cp /lib64/nvidia/wine/* $WINEPREFIX/drive_c/windows/system32

echo "Install layer to '~/.local/share/vulkan/implicit_layer.d/' [Y/n]"
read -r YESNO
if [ $YESNO = 'n' ] || [ $YESNO = 'N' ]; then
  echo Not installing layer
  exit
fi

echo "Installing layer to '~/.local/share/vulkan/implicit_layer.d/'"

cp ./layer/* ~/.local/share/vulkan/implicit_layer.d/
