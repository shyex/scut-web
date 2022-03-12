ip addr flush dev eth0
ip addr add 192.168.2.3/24 brd 192.168.2.255 dev eth0
ip route add default via 192.168.2.2
ip -6 addr add fc00::3/64 dev eth0

iptables -t nat -A PREROUTING -p udp --dport 8853 -j REDIRECT --to-port 784
ip6tables -t nat -A PREROUTING -p udp --dport 8853 -j REDIRECT --to-port 784

echo "nameserver 192.168.2.1" > /etc/resolv.conf
echo "... dns.xxx.xxx" >> /etc/hosts
echo "... dns.xxx.xxx" >> /etc/hosts
echo "... dns.xxx.xxx" >> /etc/hosts

echo "192.168.2.34 ap.scut.343.re" >> /etc/hosts
echo "192.168.2.34 st.scut.343.re" >> /etc/hosts
echo "192.168.2.34 adg.scut.343.re" >> /etc/hosts
echo "192.168.2.34 v2a.scut.343.re" >> /etc/hosts
echo "192.168.2.34 relay.scut.343.re" >> /etc/hosts
echo "192.168.2.34 route.scut.343.re" >> /etc/hosts
echo "192.168.2.34 switch.scut.343.re" >> /etc/hosts

frpc -c /etc/cleardns/frpc/frpc.ini
