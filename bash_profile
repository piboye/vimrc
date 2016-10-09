# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs


GIT_SSL_NO_VERIFY=true
PATH=$HOME/bin:$HOME/soft/clang+llvm-3.3-amd64-Ubuntu-10.04.4/bin:/usr/local/node/bin:$PATH

export PATH

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"

LC_ALL=zh_CN.utf-8
export LC_ALL

DISTCC_HOSTS="localhost 10.12.234.229 10.12.234.139"

#CC="distcc gcc" 
#CXX="distcc g++"
#
#export DISTCC_HOSTS
#export CC
#export CXX
