if [ "$(cat config | grep AdvSendAdvert | grep -o on)" = "on" ]; then
  sed -i 's/^AdvSendAdvert=.*/AdvSendAdvert=off/;' ./config
  docker restart route
fi
