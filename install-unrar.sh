#!/bin/sh

# Build and install unrar

# requires c++ compiler
sudo yum install gcc-g++

cd ~/.src
wget http://www.rarlab.com/rar/unrarsrc-5.1.1.tar.gz
tar -xzf unrarsrc-5.1.1.tar.gz
cd unrar
make -f makefile
install unrar $HOME/.local/bin
