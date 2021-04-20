#!/bin/bash

#Make sure ticker input by user is all caps
coin=${1^^}

curl https://api.coinbase.com/v2/prices/$coin-USD/sell --silent --max-time 3 | jq -r '.[].amount'| sed -e "s/^/$coin: /"
