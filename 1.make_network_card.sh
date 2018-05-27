# Connection Profile을 만든 다음에 수행한다

NETWORK_NAME=hackerton-network

FABRIC_NETWORK_PEER_ADMIN=PeerAdmin
FABRIC_NETWORK_NAME=fabric-network

PEER_ADMIN=PeerAdmin@fabric-network

cp ./hackerton-physical-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/* .
PRIV_KEY=$(ls ./hackerton-physical-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/)
cp ./hackerton-physical-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/* .

composer card create -p connection.json -u PeerAdmin -c Admin@org1.example.com-cert.pem -k $PRIV_KEY -r PeerAdmin -r ChannelAdmin

# 결과물인 카드를 import한다
composer card import -f $PEER_ADMIN.card

