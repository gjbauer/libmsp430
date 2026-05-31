#!/bin/sh

echo "Building boost_system v1.91.0..."
echo "If you want to build a newer version of boost when one comes out, update the script"

# Or whatever is the latest boost library
git clone --recursive https://github.com/boostorg/boost.git --depth 1

cd boost

git checkout boost-1.91.0

git submodule update --init --recursive --depth 1

./bootstrap.sh --prefix=/usr/local

./b2 --with-system cxxflags="-std=c++11" stage

sudo ./b2 --with-system install
