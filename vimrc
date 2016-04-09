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

" git 工具
Bundle 'tpope/vim-fugitive'

"目录比较
Bundle 'will133/vim-dirdiff.git'

"注释
Bundle 'tComment'

" html zen code
Bundle 'ZenCoding.vim'

" MarkDown 文档
Bundle 'plasticboy/vim-markdown.git'


Bundle 'AuthorInfo'
let g:vimrc_author='piboyeliu' 
let g:vimrc_email='piboye@tencent.com'
let g:vimrc_homepage=''

Bundle 'DoxygenToolkit.vim'

Bundle 'ag.vim'
let g:ag_working_path_mode="r"

"YouCompleteMe 配置文件生成
Bundle 'rdnetto/YCM-Generator'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}
" 避免询问是否加载 配置
let g:ycm_confirm_extra_conf=0

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_collect_identifiers_from_tag_files = 1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <C-t> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"
let g:ycm_min_num_of_chars_for_completion=2 

" 开启 YCM 基于标签引擎  
let g:ycm_collect_identifiers_from_tags_files=1
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
set completeopt-=preview

"语法检查, clang
Bundle 'scrooloose/syntastic'

" Dash 文档
Bundle 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch


" 对当前文件生成一个 Tag 的 列表
Bundle 'majutsushi/tagbar'
nnoremap \t :TagbarToggle<CR>

"去掉尾部空白
Bundle 'bronson/vim-trailing-whitespace'

" 赋值语句对齐
Bundle 'junegunn/vim-easy-align'

" Snip 功能
Bundle 'UltiSnips'


" NERD 目录浏览
Bundle 'The-NERD-tree'
Bundle 'jistr/vim-nerdtree-tabs'
let NERDTreeShowBookmarks=1


" 快速移动
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


"ctrlp设置,  查找文件
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
"提速 ctrlp 的匹配速度
Bundle 'FelikZ/ctrlp-py-matcher'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_lazy_update = 100
let g:ctrlp_root_markers = ['.vimprj','.prj', '.git']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|log|bin|tmp|temp)$',
  \ 'file': '\v\.(fcg|bin|out|beam|pyc|o|so|a|jar|log|bak|docx|jpeg|gif|png|jpg|tar|gz|tgz|zip|swp)$',
  \ 'link': '',
  \ }
let g:ctrlp_extensions = ['funky', 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit =  0
"set wildignore+=*.so,*.swp,*.zip,*.tar,*.tar.gz,*.tgz,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.docx,*.o,*.bak,*.log,*.bin,*.fcg,*~ 
let g:ctrlp_tabpage_position = 'ac'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 0

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore .pyc
        \ --ignore "build64_debug"
        \ --ignore "build64_release"
        \ --ignore .o
        \ --ignore .a
        \ --ignore .so
        \ -g ""'
endif
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_show_hidden = 1

set wildignore+=*~

"common

"识别文件编码
Bundle 'FencView.vim'

" vim script library, 增强 vim scripte 的功能
Bundle 'L9'

"命令行补全
Bundle 'CmdlineCompl.vim'


"目录不存在的时候， 自动创建
Bundle 'auto_mkdir'

"最近打开的文件
Bundle 'mru.vim'

"撤销历史
Bundle 'mbbill/undotree'

"Bundle 'showmarks'

"底部状态栏
Bundle 'statusline.vim'
Bundle 'bling/vim-airline'
"" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
nmap <silent> <leader>bn :bn<CR>
nmap <silent> <leader>bp :bp<CR>

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

Bundle 'powerline/powerline'




Bundle 'tpope/vim-surround'

" 增强 session
Bundle 'xolox/vim-session'

" protobuf 编辑
Bundle 'uarun/vim-protobuf'


"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
Bundle 'c.vim'
Bundle 'a.vim'

"c 语言
Bundle 'CRefVim'

"stl 
Bundle 'stlrefvim'

set path=**

"WebDav
Bundle 'Zopedav'




"Bundle 'vimprj'


"python


"js
Bundle 'othree/yajs.vim'


"extended % matching for HTML, LaTeX, and many other languages 
Bundle 'matchit.zip'

" astyle format
Bundle 'Chiel92/vim-autoformat.git'
let g:formatprg_cs = "astyle --style=google"

"配色
Bundle 'tomasr/molokai.git'
let g:rehash256 = 1
colorscheme desert 
"colorscheme molokai


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


set t_Co=256

set hlsearch

set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

set backupdir=~/backup/,.
set directory=~/backup/,.



"for ejs template 
au BufNewFile,BufRead *.ejs set filetype=html


if has("cscope")
  set csto=1
  set cst
  set nocsverb
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csverb
     
    " 查找 C 符号
    nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>

    " 查找定义
    nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>

    " 看谁调用了这个函数
    nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>

    " 查找字符串
    nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>

    " egrep 方式查找 文本
    nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>

    "查找这个文件
    nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>

    "查找 谁包含了这个文件
    nmap <C-[>i :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR>

    "查找 这个函数调用了哪些函数
    nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>


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
"call LoadCscope()
endif

function! LoadPrjVimrc()
    let cur_dir = expand('%:p:h')
    let db = findfile(".prj_vimrc", cur_dir . ";")
    if (!empty(db))
        exe "source " . db
    endif
endfunction
call LoadPrjVimrc()
"command LoadPrjVimrc call LoadPrjVimrc()

function! LoadSession()
    let cur_dir = expand('%:p:h')
    let db = findfile("session.vim", cur_dir . ";")
    if (!empty(db))
        exe "source " . db
    endif
endfunction
call LoadSession()
"command LoadSession call LoadSession()

"set autochdir


"you spectial define
if filereadable(expand("~/my.vimrc"))
    source ~/my.vimrc
endif
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

autocmd BufRead,BufNewFile *.h set filetype=c++

function! Blade(...)
    let l:old_makeprg = &makeprg
    setlocal makeprg=blade
    execute "make " . join(a:000)
    let &makeprg=old_makeprg
endfunction
set makeprg=blade\ build
nnoremap <F4> :make!<cr>
command! -complete=dir -nargs=* Blade call Blade('<args>')


"ccplint
function! CppLint(...)
    let l:args = join(a:000)
    if l:args == ""
        let l:args = expand("%")
        if l:args == ""
            let l:args = '*'
        endif
    endif
    let l:old_makeprg = &makeprg
    setlocal makeprg=cpplint.py
    execute "make " . l:args
    let &makeprg=old_makeprg
endfunction
command! -complete=dir -nargs=* Cpplint call CppLint('<args>')


"保存文件的上一次位置, 好神奇， 没看明白
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
