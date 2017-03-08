# .bashrc

# User specific aliases and functions

alias lsl="ls -lhFA | less"
alias l="ls -la"

alias l= "ls -al"
alias j="autojump"
alias ..="cd .."
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias .6='cd ../../../../../../'

alias fhere="find . -name "

alias h='history'
alias edit='vim'

alias bb='blade build -pdebug -j8'
#tmux -2 强制使用 256color
alias tmux='tmux -2'

[[ -s /home/fabien/.autojump/etc/profile.d/autojump.sh ]] && source /data/home/piboyeliu/.autojump/etc/profile.d/autojump.sh

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi

test -s ~/bin/bladefunctions && . ~/bin/bladefunctions || true
