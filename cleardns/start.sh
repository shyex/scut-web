CERT_DIR="/etc/ssl/certs/scut.343.re"
if [ "$(docker ps -a | grep -o cleardns)" != "" ]; then
  docker restart cleardns > /dev/null
else
  docker run -d \
  --privileged \
  --name cleardns \
  --restart always \
  --network macvlan \
  --hostname cleardns \
  --volume $CERT_DIR:$CERT_DIR \
  --volume /usr/bin/frpc:/usr/bin/frpc \
  --volume /etc/cleardns:/etc/cleardns \
  --volume /etc/timezone:/etc/timezone:ro \
  --volume /etc/localtime:/etc/localtime:ro \
  dnomd343/cleardns:v1.2 > /dev/null
fi
sleep 1s
docker ps -a
