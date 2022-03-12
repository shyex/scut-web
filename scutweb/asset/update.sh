VERSION=$(curl -sL "https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
mkdir temp/ && cd temp/
wget "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$VERSION/geoip.dat"
wget "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$VERSION/geosite.dat"
[ -s "geoip.dat" ] && mv -f geoip.dat ../
[ -s "geosite.dat" ] && mv -f geosite.dat ../
cd ../ && rm -rf temp/
