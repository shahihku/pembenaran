#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(cat /etc/xray/public)
clear
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e "             ═══[Trojan MahaVPN]═══"
echo -e "\e[32m════════════════════════════════════════" | lolcat
echo -e " 1)  Create Trojan S"
echo -e " 2)  Create Trojan M"
echo -e " 3)  Deleting Trojan Account"
echo -e " 4)  Renew Trojan Account"
echo -e " 5)  Check User Login Trojan"
echo -e ""
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e " x)   MENU UTAMA"
echo -e "\e[1;32m══════════════════════════════════════════\e[m"
echo -e ""
read -p "     Please Input Number  [1-5 or x] :  "  gboy
echo -e ""
case $gboy in
1)
add-trojan
;;
2)
addtj
;;
3)
deltj
;;
4)
renewtj
;;
5)
cektj
;;
x)
gboy
;;
*)
echo "Please enter an correct number"
sleep 1
menutj
;;
esac

