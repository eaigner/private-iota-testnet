#!/bin/bash

set -o xtrace

rm -rf wallet

git clone https://github.com/iotaledger/wallet

pushd wallet

git clean -fdx
git checkout tags/v2.5.1

mkdir -p iri

cp ../iri-testnet.jar iri/
mv package.testnet.json package.json

brew update
brew install node@8
brew link node@8

export PATH="/usr/local/opt/node@8/bin:$PATH"

node -v
npm -v

npm update
npm install
npm run compile:mac

mv out/mac/*.app ..