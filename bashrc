# .bashrc

# User specific aliases and functions

alias lsl="ls -lhFA | less"

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
alias j='jobs -l'
alias edit='vim'

alias bb='blade build -pdebug -j8'
#tmux -2 强制使用 256color
alias tmux='tmux -2'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi

test -s ~/bin/bladefunctions && . ~/bin/bladefunctions || true
