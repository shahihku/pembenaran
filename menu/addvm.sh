##!/bin/bash
#Rohmaniyah
#nama IP EXP
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
domainku=$(cat /etc/xray/domain)
uuid=$(uuid)
#sec=$(date +%M%S)
MYIP=$(cat /etc/xray/public)
clear
read -p "Silahkan masukan username : " user
read -p "Silahkan masukan masaaktif : " masaaktif
read -p "SIlahkan masukan email pelanggan : " reseler
user2=$(echo "$reseler" | wc -w)
if [[ $user2 -gt 0 ]]; then
echo ""
else
nais123="123"
fi
makanan=$(cat /etc/xray/domain.log | grep $reseler | cut -d " " -f 2)
user1=$(cat /etc/xray/domain.log | grep $reseler -o)
if [[ $user1 == "$reseler$nais123" ]]; then
domain="$makanan"
else
domain="$domainku"
fi
akun=$(cat /etc/xray/vmess-ws.json | grep $user -o | uniq | wc -l)
if [ $akun = 0 ]; then
clear
echo -e "user belum terdaftar (sah)"
else
clear
echo -e "user telah digunakan"
echo -e "silahkan gunakan nama user lain"
exit
fi
now=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess-ws-none.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess-ws-opok.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess-ws-habis.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess-ws.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess-grpc.json
sleep 5 && systemctl restart vmess-ws &
sleep 5 && systemctl restart vmess-grpc &
sleep 5 && systemctl restart vmess-ws-opok &
sleep 5 && systemctl restart vmess-ws-habis &
cat>/etc/xray/sampah/vmess-${user}ws-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "$domain",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
ws="vmess://$(base64 -w 0 /etc/xray/sampah/vmess-${user}ws-tls.json)"
cat>/etc/xray/sampah/vmess-${user}grpc-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vm-grpc",
      "type": "none",
      "host": "$domain",
      "tls": "tls"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
grpc="vmess://$(base64 -w 0 /etc/xray/sampah/vmess-${user}grpc-tls.json)"
cat>/etc/xray/sampah/vmess-$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "$domain",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
none="vmess://$(base64 -w 0 /etc/xray/sampah/vmess-$user-none.json)"
cat> /usr/share/nginx/html/$user$sec.conf << END
   <=  VMESS PERTAMAX =>
══════════════════════════
      <=  SG MELBICOM =>
══════════════════════════
User	     : $user
Domain	     : $domain
Key/Pass     : $uuid
Location     : Singapore
ISP	     : Melbikomas UAB
Network	     : Tcp, Ws, & gRPC
Port TLS     : 443
Port NTLS    : 80
Created      : $now
Quota        : Unlimited GB
══════════════════════════
WS Tls 	     : /vmess
WS Non Tls   : /vmess
Tsel-Opok    : /worryfree/
Orbit-Opok   : /kuota-habis/
gRPC 	     : vm-grpc
══════════════════════════
Link Vmess Websocket TLS
=> $ws
══════════════════════════
Link Vmess Websocket None TLS
=> $none
══════════════════════════
Link Vmess gRPC TLS
=> $grpc
══════════════════════════

❗️MAX LOGIN USER STB (1 STB)
❗️MAX LOGIN USER HP (2 HP)
❗️NO VOUCHERAN & RT/RW NET
❗️MELANGGAR = BANNED

Thanks
MahaVPN
══════════════════════════
    EXPIRED => $exp
══════════════════════════
END
#!/bin/bash
date=$(date)
domain=$(cat /etc/xray/domain)
cd /etc/nur
now=`date -d "0 days" +"%d-%m-%y"`
zip ${domain}-${now}.zip /etc/xray/*.json
telegram-send --file ${domain}-${now}.zip --caption "${date}"
#clear
#echo -e "======> INFORMASI ACCOUNT <======="
#echo -e "        ↡↡↡↡↡        ↡↡↡↡↡ "
#echo -e "https://$domain/$user$sec.conf"
#echo -e "        ↟↟↟↟↟        ↟↟↟↟↟ "
#echo -e "=================================="
akun=$(cat /usr/share/nginx/html/$user$sec.conf)
clear
echo -e "${akun}"
