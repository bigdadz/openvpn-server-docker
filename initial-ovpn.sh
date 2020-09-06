# open vpn passphase and key directory path
OVPN_DATA=ovpn-data

# DNS Name
dns_name=bigdadz.trueddns.com

# docker volume rm -f $OVPN_DATA
docker volume create --name $OVPN_DATA

# generete OpenVPN Server Config
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://$dns_name

# initial OpenVPN Server
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki

# Run OpenVPN Server
docker run --name ovpn-server -dit --restart unless-stopped -v $OVPN_DATA:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn