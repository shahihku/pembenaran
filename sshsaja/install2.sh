#SLOWDNS
apt update -y
apt install -y python3 python3-dnslib net-tools
apt install ncurses-utils -y
apt install dnsutils -y
apt install golang -y
apt install git -y
apt install curl -y
apt install wget -y
apt install ncurses-utils -y
apt install screen -y
apt install cron -y
apt install iptables -y
apt install -y git screen whois dropbear wget
apt install -y pwgen python php jq curl
apt install -y sudo gnutls-bin
apt install -y mlocate dh-make libaudit-dev build-essential
apt install -y dos2unix debconf-utils
service cron reload
apt install python ruby -y
gem install lolcat
service cron restart
#sl-fix
cd /usr/bin
wget -O sl-fix "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sslh-fix/sl-fix"
chmod +x sl-fix
sl-fix
cd
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
sed -i 's/Port 22/#Port 22/g' /etc/ssh/sshd_config
echo "Port 2222" >> /etc/ssh/sshd_config
echo "Port 22" >> /etc/ssh/sshd_config
rm -rf /etc/slowdns
mkdir -m 777 /etc/slowdns
wget -q -O /etc/slowdns/server.key "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/server.key"
wget -q -O /etc/slowdns/server.pub "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/server.pub"
wget -q -O /etc/slowdns/sldns-server "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/sldns-server"
wget -q -O /etc/slowdns/sldns-client "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/sldns-client"
cd
chmod +x /etc/slowdns/server.key
chmod +x /etc/slowdns/server.pub
chmod +x /etc/slowdns/sldns-server
chmod +x /etc/slowdns/sldns-client
cd
#wget -q -O /etc/systemd/system/client-sldns.service "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/client-sldns.service"
#wget -q -O /etc/systemd/system/server-sldns.service "https://raw.githubusercontent.com/fisabiliyusri/SLDNS/main/slowdns/server-sldns.service"
cd
#install client-sldns.service
cat > /etc/systemd/system/client-sldns.service << END
[Unit]
Description=Client SlowDNS By MahaVPN
Documentation=https://nekopoi.care
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-client -udp 8.8.8.8:53 --pubkey-file /etc/slowdns/server.pub $nsdomain 127.0.0.1:3369
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
cd
#install server-sldns.service
cat > /etc/systemd/system/server-sldns.service << END
[Unit]
Description=Server SlowDNS By MahaVPN
Documentation=https://nekopoi.care
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/slowdns/sldns-server -udp :5300 -privkey-file /etc/slowdns/server.key $nsdomain 127.0.0.1:2222
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
cd
chmod +x /etc/systemd/system/client-sldns.service
chmod +x /etc/systemd/system/server-sldns.service
pkill sldns-server
pkill sldns-client
systemctl daemon-reload
systemctl stop client-sldns
systemctl stop server-sldns
systemctl enable client-sldns
systemctl enable server-sldns
systemctl start client-sldns
systemctl start server-sldns
systemctl restart client-sldns
systemctl restart server-sldns
cd
#END
#INSTALL SSH
apt install dropbear
rm /etc/default/dropbear
rm /etc/issue.net
cat >  /etc/default/dropbear <<END
# disabled because OpenSSH is installed
# change to NO_START=0 to enable Dropbear
NO_START=0
# the TCP port that Dropbear listens on
DROPBEAR_PORT=143

# any additional arguments for Dropbear
DROPBEAR_EXTRA_ARGS="-p 109 -p 69 "

# specify an optional banner file containing a message to be
# sent to clients before they connect, such as "/etc/issue.net"
DROPBEAR_BANNER="/etc/issue.net"

# RSA hostkey file (default: /etc/dropbear/dropbear_rsa_host_key)
#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

# DSS hostkey file (default: /etc/dropbear/dropbear_dss_host_key)
#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

# ECDSA hostkey file (default: /etc/dropbear/dropbear_ecdsa_host_key)
#DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"

# Receive window size - this is a tradeoff between memory and
# network performance
DROPBEAR_RECEIVE_WINDOW=65536
END
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart
cat> /etc/issue.net <<END
<br>
<font color="green"><b>======================================</br></font><br>
<font color="green"><b>क═══════क  MahaVPN-Store  क═══════क</b></font><br>
<font color='red'>**********!!! Peringatan !!!**********</font><br>
<font color='yellow'><b>       JANGAN LUPA BERIBADAH </b></font><br>
<font color='red'><b>         NO SHARE ACCOUNT           </b></font><br>
<font color='blue'><b>         NO DDOS           </b></font><br>
<font color='white'><b>         NO HACKING        </b></font><br>
<font color='green'><b>         NO CARDING        </b></font><br>
<font color='yellow'><b>       NO CRIMINAL CYBER </b></font><br>
<font color='white'><b>         NO SPAM           </b></font><br>
<font color="red"><b>         IKUTI ATURAN ATAU       </b></font><br>
<font color="red"><b>         AKUN ANDA DI BANNED     </b></font><br>
<font color="black"><b>===============================</br></font><br>
<b>Buy Premium Account MahaVPN SSH/Trojan/vmess/Vless Garansi & Amanah 100%<br>
<b>Link: https://t.me/AfthonPc<br>
<font color="green"><b>क════क⊹⊱Created by GoodBoy⊰⊹क════क</br></font><br>
<font color="green"><b>======================================</br></font><br>
END
#ws-stunnel
cp ws-stunnel /usr/local/bin/ws-stunnel
# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/ssh/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\sleep 30' /etc/rc.local
sed -i '$ i\screen -dmS stunnel python /usr/local/bin/ws-stunnel' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
cd
