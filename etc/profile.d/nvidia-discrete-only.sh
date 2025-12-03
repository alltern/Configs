#export GBM_BACKEND=nvidia-drm
#export VDPAU_DRIVER=nvidia
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export VK_LOADER_DRIVERS_SELECT=*nvidia*
export LIBVA_DRIVER_NAME=nvidia
export NVD_BACKEND=direct

#UNCOMMENT BELOW if you use WINE with DXVK-NVAPI
#export DXVK_ENABLE_NVAPI=1
