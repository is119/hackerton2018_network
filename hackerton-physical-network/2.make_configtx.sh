#!/bin/bash

CHANNEL_NAME=mychannel
GENESIS_NAME=TwoOrgsOrdererGenesis
PRIV_CHANNEL_NAME=TwoOrgsChannel

#Create Genesis Block
configtxgen -profile $GENESIS_NAME -outputBlock ./channel-artifacts/genesis.block

#Create Channel Tx
configtxgen -profile PRIV_CHANNEL_NAME -outputCreateChannelTx \
    ./channel-artifacts/channel.tx -channelID $CHANNEL_NAME

#Create Anchor Peers
configtxgen -profile PRIV_CHANNEL_NAME -outputAnchorPeersUpdate \
    ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen -profile PRIV_CHANNEL_NAME -outputAnchorPeersUpdate \
    ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP