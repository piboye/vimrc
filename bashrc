# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

alias bb='blade build -pdebug -j8'
tmux -2 强制使用 256color 
alias tmux='tmux -2'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

test -s ~/bin/bladefunctions && . ~/bin/bladefunctions || true
