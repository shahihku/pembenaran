#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(cat /etc/xray/public)
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Vless MahaVPN]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Vless M"
echo -e " 2)  Create Vless S"
echo -e " 3)  Deleting Vless Account"
echo -e " 4)  Renew Vless Account"
echo -e " 5)  Check User Login Vless"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " x)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
read -p "     Please Input Number  [1-5 or x] :  "  gboy
echo -e ""
case $gboy in
1)
add-vless
;;
2)
addvl
;;
3)
delvl
;;
4)
renewvl
;;
5)
cekvl
;;
x)
gboy
;;
*)
echo "Please enter an correct number"
sleep 1
menuvl
;;
esac

