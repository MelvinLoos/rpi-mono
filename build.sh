#!/bin/bash

PREFIX=$@
if [ -z $PREFIX ]; then
  PREFIX="/usr/local"
fi

# Ensure you have write permissions to PREFIX
mkdir -p $PREFIX
chown -R `whoami` $PREFIX

PATH=$PREFIX/bin:$PATH
wget https://github.com/mono/mono/archive/mono-4.8.0.478.tar.gz
tar --checkpoint -zxf mono-4.8.0.478.tar.gz
mv mono* mono
cd mono
./autogen.sh --prefix=$PREFIX
make
make install
