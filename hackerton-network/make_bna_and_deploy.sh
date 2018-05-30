#!/bin/bash

VERSION=0.0.3

composer archive create -t dir -n .
composer network install -c admin@hackerton-network -a hackerton-network@$VERSION.bna
composer network upgrade -c admin@hackerton-network -n hackerton-network -V $VERSION
