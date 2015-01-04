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
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

"Bundle 'Independence'
"Bundle 'The-NERD-Commenter'
Bundle 'tComment'
Bundle 'ZenCoding.vim'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'pathogen.vim'

Bundle 'AuthorInfo'
Bundle 'DoxygenToolkit.vim'

if has("mac")
    Bundle "clang-complete"
    Bundle 'Valloric/YouCompleteMe'
    "开启tag 补全
    let g:ycm_collect_identifiers_from_tags_files = 1  

else
    Bundle 'Shougo/neosnippet'
    Bundle 'neocomplcache'
    source ~/neocomp.vim
endif

Bundle 'majutsushi/tagbar'

"去掉尾部空白
Bundle 'bronson/vim-trailing-whitespace'

" 赋值语句对齐
Bundle 'junegunn/vim-easy-align'

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
let g:EasyMotion_leader_key='<C-h>'
let g:EasyMotion_smartcase = 1 
map f <C-h>f
map F <C-h>F
map t <C-h>t
map T <C-h>T
"map w <C-;>w
"map W <C-;>W
"map B <C-;>B
"map b <C-;>b
"map e <C-;>e
"map E <C-;>E


"ctrlp设置
Bundle 'ctrlp.vim'
let g:ctrlp_lazy_update = 100
let g:ctrlp_root_markers = ['.vimprj','.prj', '.git']
let g:ctrlp_working_path_mode = 'cr'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|log|bin|tmp|temp)$',
  \ 'file': '\v\.(fcg|bin|out|beam|pyc|o|so|a|jar|log|bak|docx|jpeg|gif|png|jpg|tar|gz|tgz|zip|swp)$',
  \ 'link': '',
  \ }
"let g:ctrlp_extensions = ['dir', 'quickfix',  'undo', 'changes', 'tag', 'buffertag']
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit =  0 
set wildignore+=*~
"set wildignore+=*.so,*.swp,*.zip,*.tar,*.tar.gz,*.tgz,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.docx,*.o,*.bak,*.log,*.bin,*.fcg,*~ 
let g:ctrlp_tabpage_position = 'ac'
if executable('ag')
  " Use Ag over Grep
  "set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif



"common

"use my conque-shell fix vimscript site bugs;
Bundle 'piboye/Conque-Shell'
Bundle 'Shougo/vimproc.vim'

Bundle 'Vdebug'

"process file encode
Bundle 'FencView.vim'

"自动识别终端编码
let &termencoding = substitute($LC_ALL, "[a-zA-Z_-]*\.", "", "")
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

Bundle 'L9'
Bundle 'CmdlineCompl.vim'

Bundle 'auto_mkdir'
Bundle 'mru.vim'
Bundle 'Gundo'
Bundle 'statusline.vim'
Bundle 'bling/vim-airline'
Bundle 'powerline/powerline'
"let g:airline_powerline_fonts=1

Bundle 'kshenoy/vim-signature'
Bundle 'terryma/vim-expand-region'
Bundle 'ack.vim'
Bundle 'EasyGrep'

Bundle 'Tabular'
Bundle 'SuperTab'
Bundle 'Solarized'
Bundle 'tpope/vim-surround'

Bundle 'vim-ctrlspace'
"let g:ctrlspace_default_mapping_key="<C->"


"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'stlrefvim'

" this confict to neocomplcache
Bundle 'OmniCppComplete' 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

Bundle "AutoComplPop"

set complete-=i   " remove complete from include for auto complete fast
set path=**
"WebDav
Bundle 'Zopedav'


Bundle 'scrooloose/syntastic'

" YCM baddly, build too complex and confuse.
"Bundle 'Valloric/YouCompleteMe'



nnoremap \t :TagbarToggle<CR>

"depend by vimprj
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
"Bundle 'html5.vim'
Bundle 'xml.vim'
Bundle 'matchit.zip'

"Bundle "html-improved-indentation" 
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



set autoindent
set smarttab 
set tabstop=4  
set softtabstop=4
set shiftwidth=4 
set expandtab
set ic
set ai
set si

set nocompatible
set backspace=indent,eol,start
syntax enable
syntax on

set tags=tags,../tags,../../tags;../../../tags;../../../../tags
set foldmethod=syntax
set foldlevel=99
set number
set path=.,/usr/include,./include,./inc,./incl,../include,../inc,../incl

"set background=dark

Bundle 'tomasr/molokai.git'
let g:rehash256 = 1
colorscheme desert
"colorscheme molokai
"colorscheme solarized

set t_Co=256

set hlsearch

set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

set backupdir=~/backup/,.
set directory=~/backup/,.



"for ejs template 
au BufNewFile,BufRead *.ejs set filetype=html
"let g:ycm_global_ycm_extra_conf='~/vimrc/.ycm_extra_conf.py'



if has("cscope")
  set csto=1
  set cst
  set nocsverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csverb
    nmap <C-k>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-k>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-k>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-k>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"auto load cscope from root dir
function! LoadCscope()
    let cur_dir = expand('%:p:h')
    let db = findfile("cscope.out", cur_dir . ";")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
command LoadCscope call LoadCscope()

"au BufEnter /* call LoadCscope()
call LoadCscope()

endif

set autochdir


"you spectial define
if filereadable(expand("~/my.vimrc"))
    source ~/my.vimrc
endif
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end



"blade support
function! Blade(...)
    let l:old_makeprg = &makeprg
    setlocal makeprg=blade
    execute "make " . join(a:000)
    let &makeprg=old_makeprg
endfunction
set makeprg=blade\ build
nnoremap <F4> :make!<cr>

 
command! -complete=dir -nargs=* Blade call Blade('<args>')
