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
══════════════════════════                 
    <=  VMESS PERTAMAX =>       
══════════════════════════                 
    <=  By MahaVPN =>                 
══════════════════════════ 
                
Username     : $user
CITY         : NEGARAMU
ISP          : ISPMU
Host/IP      : $domain
Port ssl/tls : 443
Port non tls : 80                                     
Key          : $uuid
Network      : ws, grpc
Path         : /vmess
Path 0P0K    : /kuota-habis, /worryfree                    
serviceName  : vm-grpc               
  
══════════════════════════                 
Link Tls  => ${ws}
══════════════════════════                 
Link None => ${none}
══════════════════════════                 
Link Grpc => ${grpc}
══════════════════════════                 
     Expired => $exp
══════════════════════════                 
❗️MAX LOGIN USER STB (1 STB)                 
❗️MAX LOGIN USER HP (2 HP)                 
❗️NO VOUCHERAN & RT/RW NET                 
❗️MELANGGAR = BANNED                 
🤙MATUR TENGKYU TUWAN $user                 
══════════════════════════
    <=  FORMAT JADI =>

- name: ISPMU-WS-$exp
  server: ISI_BUG
  port: 443
  type: vmess
  uuid: $uuid
  alterId: 0
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: $domain
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: $domain
  udp: true
- name: ISPMU-WSS-$exp
  server: ISI_BUG
  port: 443
  type: vmess
  uuid: $uuid
  alterId: 0
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: $domain
  network: ws
  ws-opts:
    path: MAHA-CF:wss://$domain/vmess
    headers:
      Host: $domain
  udp: true
- name: ISPMU-Ntls-$exp
  server: ISI_BUG
  port: 80
  type: vmess
  uuid: $uuid
  alterId: 0
  cipher: auto
  tls: false
  skip-cert-verify: true
  servername: $domain
  network: ws
  ws-opts:
    path: /worryfree
    headers:
      Host: $domain
  udp: true
- name: ISPMU-gRPC-$exp
  server: ISI_BUG
  port: 443
  type: vmess
  uuid: $uuid
  alterId: 0
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: $domain
  network: grpc
  grpc-opts:
    grpc-service-name: vm-grpc
  udp: true
══════════════════════════
❗️NOTE: Format WSS Wajib Core Supp WSS
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
