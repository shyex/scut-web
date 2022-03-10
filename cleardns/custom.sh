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
frpc -c /etc/cleardns/frpc/frpc.ini
