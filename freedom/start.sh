if [ "$(docker ps -a | grep -o freedom)" != "" ]; then
  docker rm -f freedom > /dev/null
fi
docker run -d \
  --privileged \
  --name freedom \
  --restart always \
  --hostname freedom \
  --network macvlan \
  --ip 192.168.2.5 \
  --dns 192.168.2.4 \
  --env V2RAYA_V2RAY_BIN=xray \
  --env V2RAYA_ADDRESS=0.0.0.0:80 \
  --volume /etc/freedom:/etc/v2raya \
  --volume /usr/bin/xray:/usr/bin/xray \
  --volume /etc/timezone:/etc/timezone:ro \
  --volume /etc/localtime:/etc/localtime:ro \
  mzz2017/v2raya > /dev/null
sleep 1s
docker ps -a
