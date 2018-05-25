# Connection Profile을 만든 다음에 수행한다

NETWORK_NAME=hackerton-network

FABRIC_NETWORK_PEER_ADMIN=PeerAdmin
FABRIC_NETWORK_NAME=fabric-network

PEER_ADMIN=PeerAdmin@fabric-network

composer card create -p connection.json\
-u PeerAdmin\
-c Admin@org1.example.com-cert.pem\
-k 114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457_sk\
-r PeerAdmin -r ChannelAdmin

# 결과물인 카드를 import한다
composer card import -f $PEER_ADMIN.card

