#!/bin/bash

rm -rf wallet

git clone https://github.com/iotaledger/wallet

pushd wallet

git clean -fdx
git reset --hard tags/v2.5.1

mkdir -p iri

cp ../iri-*.jar iri/
cp package.testnet.json package.json

brew update
brew install node@8
brew link node@8

export PATH="/usr/local/opt/node@8/bin:$PATH"

npm update
npm install bower
npm install

npm run compile:mac

mv out/mac/*.app .

rm -rf ~/Library/Application\ Support/IOTA\ Wallet\ Testnet/