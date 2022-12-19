#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
echo -e ""
echo -e "Starting Restart All Service"
systemctl restart xray.service
systemctl restart ntls
systemctl restart trojan-ws
systemctl restart trojan-grpc
systemctl restart trojan-tcp
systemctl restart vmess-ws
systemctl restart vmess-ws-opok
systemctl restart vmess-ws-habis
systemctl restart vless-ws
systemctl restart vless-ws-opok
systemctl restart vless-ws-habis
systemctl restart vless-grpc
systemctl restart vmess-grpc
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
echo -e "Restart All Service Berhasil"
