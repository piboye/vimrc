#!/usr/bin/env bash
if [ -L ~/.vimrc ]
then
    rm ~/.vimrc
else
    mv ~/.vimrc vimrc_bak_$(whoami)_$(date +%Y%m%d)
fi

mv ~/.tmux.conf tmux_conf_bak_$(whoami)_$(date +%Y%m%d)
mv ~/.tmux.conf.local tmux_conf_local_bak_$(whoami)_$(date +%Y%m%d)
mv ~/.bash_profile bash_profile_$(whoami)_$(date +%Y%m%d)
mv ~/.bashrc bash_rc_$(whoami)_$(date +%Y%m%d)

ln -s  $(pwd)/vimrc ~/.vimrc

ln -s  $(pwd)/tmux.conf ~/.tmux.conf
ln -s  $(pwd)/tmux.conf.local ~/.tmux.conf.local
ln -s  $(pwd)/wgetrc ~/.wgetrc
ln -s  $(pwd)/gitconfig ~/.gitconfig
ln -s  $(pwd)/agignore ~/.agignore
ln -s  $(pwd)/bash_profile ~/.bash_profile
ln -s  $(pwd)/bashrc ~/.bashrc

if ! [ -d ~/.undodir ]
then
    mkdir ~/.undodir/
fi

if ! [ -d ~/bin ]
then
    mkdir -p ~/bin/
fi
chmod a+x cpplint.py
cp cpplint.py ~/bin/


if ! [ -d ~/.vim/bundle/vundle ]
then
    echo "install vundle";
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi


echo "install plugin";
vim +BundleInstall +BundleClean +qall


#echo "install command-t"
#( 
#  cd ~/.vim/bundle/Command-T/ruby/command-t; 
#  ruby2.0 extconf.rb;
#  make
#)


which js-beautify 
if (( $? != 0 ))
then
    echo "install js-beautify";
    echo "Enter root Passward"
    sudo npm install -g js-beautify
fi

if ! [ -e ~/bin/ack ] 
then
    echo "install ack"
    curl http://beyondgrep.com/ack-2.12-single-file > ~/bin/ack && chmod 0755 ~/bin/ack
fi

if ! [ -e ~/bin/cscope.sh ] 
then
    chmod a+x bin/cscope.sh
    cp bin/cscope.sh ~/bin
fi

