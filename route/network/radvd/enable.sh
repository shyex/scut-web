if [ "$(cat config | grep AdvSendAdvert | grep -o off)" = "off" ]; then
  sed -i 's/^AdvSendAdvert=.*/AdvSendAdvert=on/;' ./config
  docker restart route
fi
