#!/usr/bin/env bash
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" |  grep -v example > cscope.files
cscope -bkq -i cscope.files
#ctags --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q --exclude=lex.yy.cc --exclude=copy_lex.yy.cc -L cscope.files
