#!/bin/bash

PREFIX=$@
if [ -z $PREFIX ]; then
  PREFIX="/usr/local"
fi

# Ensure you have write permissions to PREFIX
mkdir $PREFIX
chown -R `whoami` $PREFIX

PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX
make
make install