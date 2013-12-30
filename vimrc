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

" command-t depend ruby, it is so baddly.
"Bundle 'Command-T'
"if has('mac') 
"endif

" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"
Bundle 'Independence'
Bundle 'The-NERD-Commenter'
Bundle 'taglist.vim'
Bundle 'ZenCoding.vim'
Bundle 'http://github.com/plasticboy/vim-markdown.git'
Bundle 'pathogen.vim'
Bundle 'UltiSnips'
Bundle 'AuthorInfo'
Bundle 'checksyntax'

"common
Bundle 'The-NERD-tree'
"use my conque-shell fix vimscript site bugs;
Bundle 'piboye/Conque-Shell'

Bundle 'FencView.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'CmdlineCompl.vim'

Bundle 'auto_mkdir'
Bundle 'MRU'
Bundle 'EasyMotion'
Bundle 'statusline.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Tabular'
Bundle 'SuperTab'
Bundle 'Solarized'
Bundle 'ack.vim'
Bundle 'Gundo'

Bundle 'Syntastic'

Bundle 'ctrlp.vim'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_custom_ignore = '\v\.(fcg|bin|)$'
let g:ctrlp_extensions = ['fcg', 'bin', 'out', 'o' ]

"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
Bundle 'c.vim'
Bundle 'OmniCppComplete'
Bundle 'a.vim'
Bundle 'autoload_cscope.vim'

Bundle 'Tagbar'
nnoremap <silent> <F9> :TagbarToggle<CR>

"Bundle 'lh-cpp'
"Bundle 'CRefVim'

Bundle 'DfrankUtil'
Bundle 'vimprj'
Bundle 'indexer.tar.gz'
Bundle 'CCTree'

"nodejs and coffe
Bundle 'kchmck/vim-coffee-script'

"python


"js
"Bundle 'jsbeautify'
"Bundle 'JSON.vim'
"Bundle 'pangloss/vim-javascript'


"html/xml
Bundle 'html5.vim'
Bundle 'xml.vim'
Bundle 'matchit.zip'

Bundle "html-improved-indentation" 

Bundle 'https://github.com/Chiel92/vim-autoformat.git'
let g:formatprg_args_cs="--mode=cs --style=ansi -pcHs4"
let g:vundle_default_git_proto = 'git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"ctrlp设置
""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows


set tabstop=4  
set shiftwidth=4 
set ic
set ai
set si

syntax on

"set tags=tags,../tags,../../tags;
set foldmethod=syntax
set foldlevel=99
set number
set path=.,/usr/include,./include,./inc,./incl,../include,../inc,../incl

set background=dark

colorscheme desert
set hlsearch
nnoremap <C-h> <NOP>
let g:EasyMotion_leader_key='<C-h>'

set expandtab 
set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

set backupdir=~/backup/,.
set directory=~/backup/,.

"for ejs template 
au BufNewFile,BufRead *.ejs set filetype=html

"source ~/cscope_maps.vim
