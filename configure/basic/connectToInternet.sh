#
# Purpose to connect to the internet 
#

nmcli r wifi on

nmcli d wifi connect $config_wireless_ssid 
