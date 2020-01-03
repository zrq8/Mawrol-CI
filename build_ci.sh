#!/bin/bash

jobs="-j$(nproc --all)"
commit="$(cut -c-12 <<< "$(git rev-parse HEAD)")"

cp -f ./build_tools/dtc /usr/bin
echo "Start compiling! (Using $jobs flag)"
./build_master.sh $jobs || exit

mkdir -p out
cp Mawrol-*.zip "out/$(cat version)-$commit.zip"
