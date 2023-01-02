#!/bin/bash
######################################################
#### WARNING PIPING TO BASH IS STUPID: DO NOT USE THIS
######################################################
# TESTED ON UBUNTU 22.04 LTS (Works for me)
## Made by Damien Coopmans & Sven Ronsmans ##

if [ `id -u` -ne 0 ]; then
	echo Need sudo
	exit 1
fi

set -v
sleep 2 ; clear
##########################################################
#                    Installing GNS3                     #
#                                                        #
#         download fist tools than installation          #
#                                                        #
##########################################################
sleep 3 ; clear

#update apt-cache &> /dev/null
apt update -y
apt upgrade -y

#install packages
apt install -y qemu-guest-agent

#reset hostname
truncate -s0 /etc/hostname
hostnamectl set-hostname BKM-GNS3

#cleanup apt
apt clean

#disk biger-maker (proxmox virtial disk)
pvresize /dev/vda3
lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

#disk biger-maker (hard-disk)
#pvresize /dev/sda3
#lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
#resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv

dhclient -r
sleep 2
systemctl restart networking
sleep 2

clear
######################################################
#             The Tools has been installed           #
#                Server shutdown 5 sec               #
#                                                    #
######################################################
sleep 5 ; reboot
