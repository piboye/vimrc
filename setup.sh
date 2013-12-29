#!/usr/bin/env bash
cp .vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
npm install -g js-beautify
