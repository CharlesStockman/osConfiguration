#! /bin/sh

#
# Instal AMD Graphics Driver
#

pkg install drm-kmod
sysrc kld_list+=amdgpu


