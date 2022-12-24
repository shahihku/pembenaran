#!/bin/bash
run_back() {
echo ""
read -p "Pres Enter kembali ke HOME : " jejeje        
funny    
}

clear
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • SYSTEM MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
echo -e "Domain anda saat ini:"
echo -e "$(cat /etc/xray/domain)"
echo -e ""
echo -e "Silahkan masukan domain baru anda"
read -p " Input : " domain
echo -e ""
echo -e "Sukses domain baru anda :"
echo -e "$domain"
echo -e ""
echo -e "Noted"
echo -e "Setelah ini Anda wajib melakukan generate cert ssl"
echo -e "Sikahkan cari menu generate ssl di system-menu"
run_back