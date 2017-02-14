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
tar -zxvf mono-4.8.0.478.tar.gz
rm mono-4.8.0.478.tar.gz
cd mono-mono-4.8.0.478
./autogen.sh --prefix=$PREFIX 2>&1 >/dev/null
echo "Starting make..."
make 2>&1 >/dev/null
echo "Starting make install..."
make install 2>&1 >/dev/null
