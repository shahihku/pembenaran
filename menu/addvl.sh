#!/bin/bash
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
akun=$(cat /etc/xray/vless-ws.json | grep $user -o | uniq | wc -l)
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
},{"id": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/vless-ws.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/vless-ws-opok.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/vless-ws-habis.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/vless-grpc.json
ws="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&type=ws#${user}"
grpc="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vl-grpc&sni=${domain}#${user}"
ws-none="vless://${uuid}@${domain}:80?path=%2Fvless&security=none&encryption=none&host=$domain&type=ws#$user"
ws-opok="vless://${uuid}@${domain}:80?path=%2Fworryfree&security=none&encryption=none&host=tsel.me&type=ws#$user"
ws-habis="vless://${uuid}@${domain}:80?path=%2Fkuota-habis&security=none&encryption=none&host=myorbit.id&type=ws#$user"
sleep 5 && systemctl restart vless-ws &
sleep 5 && systemctl restart vless-ws-opok &
sleep 5 && systemctl restart vless-ws-habis &
sleep 5 && systemctl restart vless-grpc &
cat> /usr/share/nginx/html/$user$sec.conf << END
   <=  VLESS PERTAMAX =>
══════════════════════════
      <=  ID HERZA =>
══════════════════════════
User	     : $user
Domain	     : $domain
Key/Pass     : $uuid
Location     : Indonesia
ISP	     : Herza Digital Indonesia
Network	     : Tcp, Ws, & gRPC
Port TLS     : 443
Port NTLS    : 80
Created      : $now
Quota        : Unlimited GB
══════════════════════════
WS Tls 	     : /vless
WS Non Tls   : /vless
Tsel-Opok    : /worryfree
Orbit-Opok   : /kuota-habis
gRPC 	     : vl-grpc
══════════════════════════
Link Vless Websocket TLS
=> $ws
══════════════════════════
Link Vless Websocket NTLS
=> $ws-none
══════════════════════════
Link Vless gRPC TLS
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

