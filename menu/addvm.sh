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
akun=$(cat /etc/xray/vmess-grpc.json | grep $user -o | uniq | wc -l)
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
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user$sec""'"' /etc/xray/vmess*
sleep 15 && systemctl restart vmess-ws &
sleep 15 && systemctl restart vmess-grpc &
sleep 15 && systemctl restart vmess-ws-orbit &
sleep 15 && systemctl restart vmess-ws-orbit1 &
}

#LINK  
run_link() {
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
      "path": "/worryfree",
      "type": "none",
      "host": "$domain",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
none="vmess://$(base64 -w 0 /etc/xray/sampah/vmess-$user-none.json)" 
clear                        
}  
            
#OUTPUT_AKUN
run_output_akun() {                 
echo -e "══════════════════════════"                 
echo -e "    <=  VMESS PERTAMAX =>"       
echo -e "══════════════════════════"                 
echo -e "    <=  By MahaVPN =>"                 
echo -e "══════════════════════════" 
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /etc/xray/city)"
echo -e "ISP          : $(cat /etc/xray/isp)"
echo -e "Host/IP      : $domain"
echo -e "Port ssl/tls : 443"
echo -e "Port non tls : 80"                                        
echo -e "Key          : $uuid"
echo -e "Network      : ws, grpc"
echo -e "Path         : /vmess"
echo -e "Path 0P0K    : /kuota-habis, /worryfree"                    
echo -e "serviceName  : vm-grpc"               
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
run_link
run_output_akun   
run_tele > /dev/null &      

END
zip ${domain}-${now}.zip /etc/xray/*.json
telegram-send --file ${domain}-${now}.zip --caption "${date}"       
            
