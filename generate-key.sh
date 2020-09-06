# open vpn passphase and key volume
OVPN_DATA=ovpn-data

# client uniq name
CLIENTNAME=client_name

# generate client ovpn file
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass

# export client ovpn file
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
