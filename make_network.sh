#!/bin/bash

FABRIC_NETWORK_PEER_ADMIN=PeerAdmin
FABRIC_NETWORK_NAME=fabric-network

NETWORK_NAME=hackerton-network
NETWORK_VERSION=0.0.1
PEER_ADMIN=PeerAdmin@fabric-network

ADMIN_NAME=
ADMIN_SECRET=

# 비즈니스 카드 만들기
composer archive create --archiveFile $NETWORK_NAME@$NETWORK_VERSION.bna \
 --sourceType dir --sourceName $NETWORK_NAME


# 인자 start -> 네트워크
if [ $1 -eq 'start' ]; then
    # 물리 네트워크에 비즈니스 카드 설치
    composer network install -c PeerAdmin@fabric-network\
    -a $NETWORK_NAME@$NETWORK_VERSION.bna
    # 비즈니스 네트워크 시작
    composer network start --networkName $NETWORK_NAME \
    --networkVersion $NETWORK_VERSION -A $ADMIN_NAME -S $ADMIN_SECRET -c $PEER_ADMIN
else
    # 비즈니스 네트워크 버전 업데이트
    composer network upgrade -c $PEER_ADMIN -n $NETWORK_NAME -V $NETWORK_VERSION
if