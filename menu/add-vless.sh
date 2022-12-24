#!/bin/bash
domain=$(cat /etc/xray/domain)
uuid=$(uuid)
#MASUKAN
run_masukan() {
read -p "Username         : " user
read -p "Masaaktif        : " masaaktif
}

#CEK_USER        
run_cek_user() {        
akun=$(cat /etc/xray/vless-grpc.json | grep $user -o | uniq | wc -l)
if [ $akun = 0 ]; then
clear
echo > /dev/null
else
clear
echo -e "user telah digunakan"
echo -e "silahkan gunakan nama user lain"
exit
fi
}

#WRITE_JSON
run_write_json() {            
now=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray$/a\#### '"$user$sec $exp"'\
},{"id": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/vless*
ws="vless://${uuid}@${domain}:443?path=%2Fvless&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
grpc="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vl-grpc&sni=${domain}#${user}"
none="vless://${uuid}@${domain}:80?path=%2Fvless&security=none&encryption=none&host=${domain}&type=ws#${user}"
sleep 15 && systemctl restart vless-ws &
sleep 15 && systemctl restart vless-grpc &
clear
}
            
#OUTPUT_AKUN
run_output_akun() {                 
echo -e "══════════════════════════"                 
echo -e "    <=  VLESS PERTAMAX =>"       
echo -e "══════════════════════════"                 
echo -e "    <=  By MahaVPN =>"                 
echo -e "══════════════════════════" 
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /etc/xray/city)"
echo -e "ISP          : $(cat /etc/xray/isp)"
echo -e "Host/IP      : $domain"
echo -e "Port tls/ssl : 443"
echo -e "Port non tls : 80, 8080"                
echo -e "Key          : $uuid"
echo -e "Network      : ws, grpc"
echo -e "Path TLS     : /vless"
echo -e "serviceName  : vl-grpc"               
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Link Tls  => ${ws}"
echo -e "══════════════════════════"                 
echo -e "Link None => ${none}"
echo -e "══════════════════════════"                 
echo -e "Link Grpc => ${grpc}"
echo -e "══════════════════════════"                 
echo -e "     Expired => $exp"
echo -e "══════════════════════════"                 
echo -e "❗️MAX LOGIN USER STB (1 STB)" 
echo -e "  Note: Max 7 user tersambung ke STB"               
echo -e "❗️MAX LOGIN USER HP (2 HP)"                 
echo -e "❗️NO VOUCHERAN & RT/RW NET"                 
echo -e "❗️MELANGGAR = BANNED"                 
echo -e "🤙MATUR TENGKYU TUWAN $user"                 
echo -e "══════════════════════════"
echo -e "    <=  FORMAT JADI =>"
echo -e ""
echo -e "- name: ISPMU-WS-$exp"
echo -e "  server: ISI_BUG"
echo -e "  port: 443"
echo -e "  type: vless"
echo -e "  uuid: $uuid"
echo -e "  cipher: auto"
echo -e "  tls: true"
echo -e "  skip-cert-verify: true"
echo -e "  servername: $domain"
echo -e "  network: ws"
echo -e "  ws-opts:"
echo -e "    path: /vless"
echo -e "    headers:"
echo -e "      Host: $domain" 
echo -e "  udp: true"
echo -e "- name: ISPMU-WSS-$exp"
echo -e "  server: ISI_BUG"
echo -e "  port: 443"
echo -e "  type: vless"
echo -e "  uuid: $uuid"
echo -e "  cipher: auto"
echo -e "  tls: true"
echo -e "  skip-cert-verify: true"
echo -e "  servername: $domain"
echo -e "  network: ws"
echo -e "  ws-opts:"
echo -e "    path: MAHA-CF:wss://$domain/vless"
echo -e "    headers:"
echo -e "      Host: $domain" 
echo -e "  udp: true"
echo -e "- name: ISPMU-Ntls-$exp" 
echo -e "  server: ISI_BUG" 
echo -e "  port: 80"
echo -e "  type: vless"
echo -e "  uuid: $uuid" 
echo -e "  cipher: auto"
echo -e "  tls: false"
echo -e "  skip-cert-verify: true"
echo -e "  servername: $domain" 
echo -e "  network: ws"
echo -e "  ws-opts:"
echo -e "    path: /vless"
echo -e "    headers:"
echo -e "      Host: $domain" 
echo -e "  udp: true"
echo -e "- name: ISPMU-gRPC-$exp" 
echo -e "  server: ISI_BUG" 
echo -e "  port: 443"
echo -e "  type: vless"
echo -e "  uuid: $uuid"
echo -e "  cipher: auto"
echo -e "  tls: true"
echo -e "  skip-cert-verify: true"
echo -e "  servername: $domain" 
echo -e "  network: grpc"
echo -e "  grpc-opts:"
echo -e "    grpc-service-name: vl-grpc"
echo -e "  udp: true"
echo -e "══════════════════════════"
echo -e "❗️NOTE: Format WSS Wajib Core Supp WSS"
}
            
run_tele() {
telegram-send --pre "$(run_output_akun)"                        
}              

#execute    
run_masukan
run_quota
run_iplimit
run_cek_user
run_write_json   
run_output_akun  
run_tele > /dev/null &

END
zip ${domain}-${now}.zip /etc/xray/*.json
telegram-send --file ${domain}-${now}.zip --caption "${date}"
            
