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
#sec=$(date +%M%S)
uuid=$(uuid)
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
akun=$(cat /etc/xray/trojan-ws.json | grep $user -o | uniq | wc -l)
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
},{"password": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/trojan-tcp.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"password": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/trojan-ws.json
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"password": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/trojan-grpc.json
gfw="trojan://${uuid}@${domain}:443"
ws="trojan://${uuid}@${domain}:443?path=/trojan&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
grpc="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=tr-grpc&sni=${domain}#${user}"
sleep 5 && systemctl restart trojan-ws &
sleep 5 && systemctl restart trojan-tcp &
sleep 5 && systemctl restart trojan-grpc &
cat> /usr/share/nginx/html/$user$sec.conf << END
   <=  TROJAN PERTAMAX =>
══════════════════════════
      <=  ISPMU  =>
══════════════════════════
User	     : $user
Domain	     : $domain
Key/Pass     : $uuid
Location     : NEGARAMU
ISP	     : ISPMU
Network	     : Tcp, Ws, & gRPC
Port TLS     : 443
Port NTLS    : 80
Created      : $now
Tcp/Gfw      : Yes
Websocket    : /trojan
gRPC	     : tr-grpc
Quota        : Unlimited GB
══════════════════════════
Link Trojan Tcp/Gfw TLS
=> $gfw
══════════════════════════
Link Trojan Websocket TLS
=> $ws
══════════════════════════
Link Trojan gRPC TLS
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
