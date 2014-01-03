let $GIT_SSL_NO_VERIFY='true'
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
let g:vundle_default_git_proto = 'https'

" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'

" command-t depend ruby, it is so baddly.
"Bundle 'Command-T'
"if has('mac') 
"endif

" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...
"
"Bundle 'Independence'
"Bundle 'The-NERD-Commenter'
"Bundle 'taglist.vim'
Bundle 'tComment'
Bundle 'ZenCoding.vim'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'pathogen.vim'

Bundle 'AuthorInfo'

Bundle 'Shougo/neosnippet'
Bundle 'neocomplcache'
Bundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
"Bundle 'honza/vim-snippets'
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Essetial vim plugin
Bundle 'The-NERD-tree'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'EasyMotion'
nnoremap <C-h> <NOP>
let g:EasyMotion_leader_key='<C-h>'

"ctrlp设置
Bundle 'ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|log|bin|tmp|temp)$',
  \ 'file': '\v\.(fcg|bin|out|beam|pyc|o|so|a|jar|log|bak|docx|jpeg|gif|png|jpg|tar|gz|tgz|zip|swp)$',
  \ 'link': '',
  \ }
let g:ctrlp_extensions = ['quickfix',  'undo', 'changes', 'tag', 'buffertag', 'dir']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0 
set wildignore+=*~
"set wildignore+=*.so,*.swp,*.zip,*.tar,*.tar.gz,*.tgz,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.docx,*.o,*.bak,*.log,*.bin,*.fcg,*~ 
let g:ctrlp_tabpage_position = 'ac'



"common

"use my conque-shell fix vimscript site bugs;
Bundle 'piboye/Conque-Shell'

"process file encode
Bundle 'FencView.vim'

Bundle 'L9'
Bundle 'CmdlineCompl.vim'

Bundle 'auto_mkdir'
"Bundle 'MRU'
Bundle 'mru.vim'
Bundle 'Gundo'
Bundle 'statusline.vim'
Bundle 'Lokaltog/vim-powerline'

Bundle 'ack.vim'
Bundle 'EasyGrep'

Bundle 'Tabular'
Bundle 'SuperTab'
Bundle 'Solarized'
Bundle 'tpope/vim-surround'


"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'autoload_cscope.vim'

Bundle 'OmniCppComplete'
Bundle "AutoComplPop"

"WebDav
Bundle 'Zopedav'

if has("mac")
    Bundle "clang-complete"
endif
Bundle 'Syntastic'

" YCM baddly, build too complex and confuse.
"Bundle 'Valloric/YouCompleteMe'


Bundle 'Tagbar'

nnoremap \t :TagbarToggle<CR>

Bundle 'DfrankUtil'
Bundle 'vimprj'
Bundle 'indexer.tar.gz'

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

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.



set tabstop=4  
set shiftwidth=4 
set ic
set ai
set si

syntax on

set tags=tags,../tags,../../tags;
set foldmethod=syntax
set foldlevel=99
set number
set path=.,/usr/include,./include,./inc,./incl,../include,../inc,../incl

set background=dark

colorscheme desert
set hlsearch

set expandtab 
set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

set backupdir=~/backup/,.
set directory=~/backup/,.

"for ejs template 
au BufNewFile,BufRead *.ejs set filetype=html
"let g:ycm_global_ycm_extra_conf='~/vimrc/.ycm_extra_conf.py'

"you spectial define
if filereadable("~/my.vimrc")
    source ~/my.vimrc
endif
