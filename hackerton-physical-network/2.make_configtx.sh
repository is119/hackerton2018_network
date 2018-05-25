#!/bin/bash

CHANNEL_NAME=mychannel

#Create Genesis Block
configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./channel-artifacts/genesis.block

#Create Channel Tx
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx \
    ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

#Create Anchor Peers
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate \
    ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile TwoOrgsChannel -outputAnchorPeersUpdate \
    ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP