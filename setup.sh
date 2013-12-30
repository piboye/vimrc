#!/usr/bin/env bash
if [ -L ~/.vimrc ] 
then
    rm ~/.vimrc
else
    mv ~/.vimrc vimrc_bak_$(whoami)_$(date +%Y%m%d)
fi

ln -s $(pwd)/.vimrc ~/.vimrc

if [ -d ~/.vim/bundle/vundle ]
then
    echo "install vundle";
else 
    echo "install vundle";
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "install plugin";
vim +BundleInstall +qall


echo "install command-t"
( 
  cd ~/.vim/bundle/Command-T/ruby/command-t; 
  ruby2.0 extconf.rb;
  make
)


echo "install js-beautify";
npm install -g js-beautify

echo "install ack"
curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
