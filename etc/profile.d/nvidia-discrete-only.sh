#export GBM_BACKEND=nvidia-drm
#export VDPAU_DRIVER=nvidia
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json
export LIBVA_DRIVER_NAME=nvidia
export NVD_BACKEND=direct

#UNCOMMENT BELOW if you use WINE with DXVK-NVAPI
#export DXVK_ENABLE_NVAPI=1
