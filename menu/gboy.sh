#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'

run_back() {
echo ""
read -p "Pres Enter kembali ke HOME : " jejeje        
gboy    
}

# VPS Information
#Domain
domain=$(cat /etc/xray/domain)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
DATE2=$(date -R | cut -d " " -f -5)
IPVPS=$(cat /etc/xray/ip)
clear 
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                 • MahaVpn •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[33m OS            \e[0m:  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`	
echo -e "\e[33m IP            \e[0m:  $IPVPS"	
echo -e "\e[33m ISP           \e[0m:  $ISP"
echo -e "\e[33m CITY          \e[0m:  $CITY"
echo -e "\e[33m DOMAIN        \e[0m:  $domain"	
echo -e "\e[33m DATE & TIME   \e[0m:  $DATE2"	
echo -e "\e[33m UPTIME        \e[0m:  $uptime"	
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "                 • SCRIPT MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [\e[36m•1\e[0m] Vmess Menu"
echo -e " [\e[36m•2\e[0m] Vless Menu"
echo -e " [\e[36m•3\e[0m] Trojan Menu"
echo -e " [\e[36m•4\e[0m] System Menu"
echo -e " [\e[36m•5\e[0m] Status Service"
echo -e ""
echo -e " [\e[36m•x\e[0m] Close Panel"
echo -e   ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
1) clear ; menuvm ;;
2) clear ; menuvl ;;
3) clear ; menutj ;;
4) clear ; menusys ;;
5) clear ; cek-service ; run_back ;;
6) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; gboy ;;
esac
