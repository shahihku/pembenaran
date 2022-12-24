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
akun=$(cat /etc/xray/trojan-grpc.json | grep $user -o | uniq | wc -l)
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
sed -i '/#xray$/a\#### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user$sec""'"' /etc/xray/trojan*
gfw="trojan://${uuid}@${domain}:443"             
ws="trojan://${uuid}@${domain}:443?path=/trojan&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
grpc="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=tr-grpc&sni=${domain}#${user}"                
#sleep 15 && systemctl restart trojan-tcp &
sleep 15 && systemctl restart trojan-ws &
sleep 15 && systemctl restart trojan-grpc &                
clear
}
           
           
#OUTPUT_AKUN
run_output_akun() {                 
echo -e "══════════════════════════"                 
echo -e "    <=  TROJAN PERTAMAX =>"       
echo -e "══════════════════════════"                 
echo -e "    <=  By MahaVPN =>"                 
echo -e "══════════════════════════"                                  
echo -e ""
echo -e "Username     : $user"
echo -e "CITY         : Singapore"
echo -e "ISP          : Digital Ocean"
echo -e "Host/IP      : $domain"
echo -e "Port         : 443"
echo -e "Key          : $uuid"
echo -e "Network      : gfw, ws, grpc"
echo -e "Path         : /trojan"
echo -e "serviceName  : tr-grpc"               
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Link Gfw  => ${gfw}"
echo -e "══════════════════════════"                 
echo -e "Link Ws   => ${ws}"
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
echo -e "    <=  Format Jadi =>"    
echo -e ""
echo -e "- name: ISPMU-WS-$exp"
echo -e "  server: ISI_BUG"
echo -e "  port: 443"
echo -e "  type: trojan"
echo -e "  password: $uuid"
echo -e "  skip-cert-verify: true"
echo -e "  sni: $domain"
echo -e "  network: ws"
echo -e "  ws-opts:"
echo -e "    path: /trojan"
echo -e "    headers:"
echo -e "      Host: $domain"
echo -e "  udp: true"
echo -e "- name: ISPMU-WSS-$exp"
echo -e "  server: ISI_BUG"
echo -e "  port: 443"
echo -e "  type: trojan"
echo -e "  password: $uuid"
echo -e "  network: ws"
echo -e "  sni: $domain"
echo -e "  skip-cert-verify: true"
echo -e "  udp: true"
echo -e "  ws-opts:"
echo -e "    path: MAHA-CF:wss://$domain/trojan"
echo -e "    headers:"
echo -e "        Host: $domain"
echo -e "- name: ISPMU-gRPC-$exp"
echo -e "  server: ISI_BUG"
echo -e "  port: 443"
echo -e "  type: trojan"
echo -e "  password: $uuid"
echo -e "  skip-cert-verify: true"
echo -e "  sni: $domain"
echo -e "  network: grpc"
echo -e "  grpc-opts:"
echo -e "   grpc-service-name: tr-grpc"
echo -e "  udp: true"
echo -e "══════════════════════════"
echo -e "❗️NOTE: Format WSS Wajib Core Supp WSS"
}

run_tele() {
telegram-send --pre "$(run_output_akun)"                        
}   
   
#execute    
run_masukan
run_cek_user
run_write_json   
run_output_akun
run_tele > /dev/null &            

END
zip ${domain}-${now}.zip /etc/xray/*.json
telegram-send --file ${domain}-${now}.zip --caption "${date}"
