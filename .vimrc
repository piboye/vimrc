set tabstop=4  
set shiftwidth=4 
set ic
set ai
set si


let $GIT_SSL_NO_VERIFY='true'

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"


Bundle 'The-NERD-Commenter'
Bundle 'taglist.vim'
Bundle 'ZenCoding.vim'
Bundle 'css_color.vim'
"Bundle 'snipMate.vim'
Bundle 'Markdown.vim'
Bundle 'pathogen.vim'
Bundle 'UltiSnips'
Bundle 'Mark'
Bundle 'AuthorInfo'
Bundle 'checksyntax'

"common
Bundle 'The-NERD-tree'
Bundle 'Conque-Shell'
Bundle 'FencView.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'CmdlineCompl.vim'
Bundle 'qiushibaike'
Bundle 'auto_mkdir'
"Bundle 'mru'
Bundle 'EasyMotion'
"Bundle 'statusline.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Tabular'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'valgrind.vim'
Bundle 'SuperTab'
Bundle 'Solarized'

"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
Bundle 'gdbvim.tar.gz'
Bundle 'c.vim'
Bundle 'OmniCppComplete'
Bundle 'a.vim'
Bundle 'autoload_cscope.vim'

"python
Bundle 'pyflakes'
Bundle 'pydoc.vim'


"js
Bundle 'jsbeautify'
Bundle 'javascipt.vim'
Bundle 'JSON.vim'

"html/xml
Bundle 'html5.vim'
Bundle 'xml.vim'
Bundle 'matchit.zip'
Bundle 'css.vim'

"github
Bundle 'fugitive.vim'



filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

syntax on
set tags=tags;
set foldmethod=syntax
set foldlevel=99

set background=dark

colorscheme desert
set hlsearch
nnoremap '^H'  <NOP>
let g:EasyMotion_leader_key='^H'

set expandtab 
set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8
