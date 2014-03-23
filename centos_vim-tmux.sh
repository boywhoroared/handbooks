#!/bin/bash

# Install vim 7.4 on Cent OS 5.9 (or higher?) without root privileges.

# Setup local hierarchy
mkdir $HOME/local $HOME/src

# INSTALL NCURSES 5.7 (dependency for tmux and vim) 
# (5.9 will probably work; I tried to stay close to the version in the packages)

mkdir -p $HOME/src/ncurses

# get source
cd $HOME/src/ncurses
wget http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.7.tar.gz
cd $HOME/src/ncurses
tar -xf ncurses-5.7.tar.gz
cd $HOME/src/ncurses/ncurses-5.7

# install for static use and without the c++ bindings  (fails with the bindings)
make clean; ./configure --prefix=$HOME/local --without-cxx-binding --disable-shared --enable-static --with-termlib --with-ticlib 
make install

# INSTALL VIM 7.4

mkdir -p $HOME/src/vim-7.4 $HOME/src/vim-7.4/patches

# get source and all patches 
cd $HOME/src/vim-7.4

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
cd $HOME/src/vim-7.4/patches
wget ftp://ftp.vim.org/pub/vim/patches/7.4/*
cd $HOME/src/vim-7.4/patches
rm MD5 MD5SUMS README

# extract source; apply patches
cd $HOME/src/vim-7.4/
tar xvjf vim-7.4.tar.bz2
cat patches/* > vim74/patch.txt
cd vim74
patch -b -p0 < patch.txt | tee -a patch.log

# install
export LDFLAGS=-L$HOME/local/lib 
make clean distclean; 
./configure  --prefix=$HOME/local --with-features=huge --enable-pythoninterp --enable-cscope --disable-nls
make install

# INSTALL LIBEVENT (tmux dependency)
cd $HOME/src/libevent-2.0.21-stable
make clean 
./configure --disable-shared --enable-static --prefix=$HOME/local
make install

# INSTALL TMUX
# no wget for tmux since it's on sourceforge. get it via the browser
cd $HOME/src/tmux-1.9a
export PKG_CONFIG_PATH=$HOME/local/lib/pkgconfig 
export CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"
export CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"
export LDFLAGS="-L$HOME/local/lib" 
make clean
./configure --enable-static --prefix=$HOME/local
make install

# IMPORTANT: Update your $PATH.
# export PATH=$HOME/local:$PATH
# 
# If you don't, you wont have access to your new shiny vim and tmux binaries


# I use make clean; [command] rather than make clean && [command] above because
# if this is the first time you've built the projects you might not actually
# have a Makefile present yet.
