if [ "$(docker ps -a | grep -o archive)" != "" ]; then
  docker rm -f archive > /dev/null
fi
docker run -dit \
  --name archive \
  --restart always \
  --hostname archive \
  --volume /etc/archive:/etc/archive \
  --volume /etc/route/log:/etc/route/log \
  --volume /etc/scutweb/log:/etc/scutweb/log \
  --volume /etc/timezone:/etc/timezone:ro \
  --volume /etc/localtime:/etc/localtime:ro \
  archive:latest > /dev/null
sleep 1s
docker ps -a
