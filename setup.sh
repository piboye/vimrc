#!/usr/bin/env bash
if [ -L ~/.vimrc ] 
then
    rm ~/.vimrc
else
    mv ~/.vimrc vimrc_bak_$(whoami)_$(date +%Y%m%d)
fi

ln -s $(pwd)/.vimrc ~/.vimrc

if ! [ -d ~/.vim/bundle/vundle ]
then
    echo "install vundle";
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

echo "install plugin";
vim +BundleClean +BundleInstall +qall


echo "install command-t"
( 
  cd ~/.vim/bundle/Command-T/ruby/command-t; 
  ruby2.0 extconf.rb;
  make
)


echo "install js-beautify";
which js-beautify 
if (( $? != 0 ))
then
    echo "Enter root Passward"
    sudo npm install -g js-beautify
fi

echo "install ack"
if ! [ -e ~/bin/ack ] 
then
    curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
fi
