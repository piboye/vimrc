#!/usr/bin/env bash
mv ~/.vimrc vimrc_bak_$(date +%Y%m%d)
ln -s .vimrc ~/.vimrc

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

npm install -g js-beautify

# install ack
curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 !#:3
