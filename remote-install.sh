sleep 5
clear

##########################################################
#                    Installing GNS3                     #
#                                                        #
#       download fist tools than it be running           #
#                                                        #
##########################################################

apt update ; apt upgrade -y
mkdir -p /tmp/gns-installer
cd /tmp/gns-installer
curl https://raw.githubusercontent.com/GNS3/gns3-server/master/scripts/remote-install.sh > gns3-remote-install.sh
bash gns3-remote-install.sh --with-openvpn --with-iou --with-i386-repository

clear

######################################################
#             Installation Succesful                 #
#                 Server rebooting 5sec              #
#                                                    #
######################################################
sleep 5 ; reboot
