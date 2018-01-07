#!/bin/bash

if [ ! -d "iri" ]; then
	git clone https://github.com/eaigner/iri
fi

pushd iri

git reset --hard tags/v1.4.1.6
git clean -fdx
git apply ../iri-snapshot.patch

cp ../Snapshot.txt src/main/resources

mvn package -Dmaven.test.skip=true

cp target/iri-*.jar ../iri-testnet.jar
