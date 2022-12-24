#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(cat /etc/xray/public)
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Vmess MahaVPN]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Vmess S"
echo -e " 2)  Create Vmess M"
echo -e " 3)  Deleting Vmess Account"
echo -e " 4)  Renew Vmess Account"
echo -e " 5)  Check User Login Vmess"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " x)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
read -p "     Please Input Number  [1-5 or x] :  "  gboy
echo -e ""
case $gboy in
1)
add-vmess
;;
2)
addvm
;;
3)
delvm
;;
4)
renewvm
;;
5)
cekvm
;;
x)
gboy
;;
*)
echo "Please enter an correct number"
sleep 1
menuvm
;;
esac

