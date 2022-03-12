if [ "$(docker ps -a | grep -o scutweb)" != "" ]; then
  docker restart scutweb > /dev/null
else
  docker run -d \
  --privileged \
  --name scutweb \
  --restart always \
  --network macvlan \
  --hostname scutweb \
  --volume /etc/scutweb:/etc/xray/expose \
  --volume /etc/timezone:/etc/timezone:ro \
  --volume /etc/localtime:/etc/localtime:ro \
  dnomd343/tproxy:v1.3 > /dev/null
fi
sleep 1s
docker ps -a
