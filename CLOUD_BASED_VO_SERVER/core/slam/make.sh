#!/bin/bash
echo $1
cd build
make
cd ..
#./bin/$1
cd lib
luajit slamInterface.lua
cd ..
