let $GIT_SSL_NO_VERIFY='true'
set nocompatible              " be iMproved
filetype off                  " required!

let mapleader="\<Space>"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
let g:vundle_default_git_proto = 'https'

Bundle 'Shougo/neobundle.vim'

" My bundles here:

" git 工具
Bundle 'tpope/vim-fugitive'
" 代码中显示哪些做了修改
Bundle 'jisaacks/GitGutter'

"目录比较
Bundle 'will133/vim-dirdiff.git'

"注释
Bundle 'tComment'

" html zen code
Bundle 'mattn/emmet-vim'

" MarkDown 文档
Bundle 'plasticboy/vim-markdown.git'


" Doxygen
Bundle 'DoxygenToolkit.vim'

" 替换 grep 查找
Bundle 'ack.vim'
Bundle 'ag.vim'


let g:ag_working_path_mode="r"
"YouCompleteMe 配置文件生成
"Bundle 'rdnetto/YCM-Generator'
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
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_key_invoke_completion = '<C-e>' " 默认是 Ctr-space 开启
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <C-t> :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_use_ultisnips_completer=1
let g:ycm_min_num_of_chars_for_completion=1

" 开启 YCM 基于标签引擎 
let g:ycm_collect_identifiers_from_tags_files=1
set completeopt=menu,preview

"语法检查, clang
Bundle 'scrooloose/syntastic'
"因为Python已经有pylint来检查,
"而且syntastic检查Python会在保存时有很长时间的卡顿,
"所以禁用它对Python文件的检查
let g:syntastic_ignore_files=[".*\.py$"]


" 自动关闭 引号 括号等
Bundle 'Raimondi/delimitMate'

" / 搜索的时候可以完成输入
Bundle 'SearchComplete'

"增强 . 的重复能力
Bundle 'tpope/vim-repeat'

" Dash 文档
Bundle 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch


" 对当前文件生成一个 Tag 的 列表
Bundle 'majutsushi/tagbar'
nnoremap <space>t :TagbarToggle<CR>

"去掉尾部空白
Bundle 'bronson/vim-trailing-whitespace'

" 赋值语句对齐
Bundle 'junegunn/vim-easy-align'


" Snip 功能
Bundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" NERD 目录浏览
Bundle 'The-NERD-tree'
Bundle 'jistr/vim-nerdtree-tabs'
let NERDTreeShowBookmarks=1
nmap <silent> <space>n :NERDTreeToggle<CR>

"tab 页切换
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" 快速移动
Bundle 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
nmap t <Plug>(easymotion-overwin-f2)
" Move to word
"map  <space>w <Plug>(easymotion-bd-w)
"nmap <space>w <Plug>(easymotion-overwin-w)

" Move to Line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)


"增量 search 也支持 easy-motion
Bundle 'haya14busa/incsearch.vim'
Bundle 'haya14busa/incsearch-easymotion.vim'
Bundle 'haya14busa/incsearch-fuzzy.vim'
function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

"模糊查找
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <space>/ incsearch#go(<SID>config_easyfuzzymotion())
noremap <silent><expr> <space>?  incsearch#go(<SID>config_easyfuzzymotion({'command': '?'}))
noremap <silent><expr> <space>g/ incsearch#go(<SID>config_easyfuzzymotion({'is_stay': 1}))


"ctrlp设置,  查找文件
Bundle 'kien/ctrlp.vim'
"ctrlpvim/ctrlp.vim 有更新， kien 不更新了
"Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
"提速 ctrlp 的匹配速度
Bundle 'FelikZ/ctrlp-py-matcher'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_lazy_update = 100
let g:ctrlp_root_markers = ['BLADE_ROOT', '.prj', '.git']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['funky', 'tag', 'buffertag', 'quickfix', 'dir',
                          \ 'undo', 'line', 'changes', 'mixed']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_show_hidden = 1

"line search
nnoremap ,l :CtrlPLine<cr>

nnoremap <space>f :CtrlPFunky<cr>

"outline
nnoremap <space>o :CtrlPBufTag<cr>

"buffer
nnoremap <space>e :CtrlPBuffer<cr>

"quickfix
nnoremap <space>q :CtrlPQuickfix<cr>


if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --vimgrep'


  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore ".*"
        \ --ignore "build64_debug"
        \ --ignore "build64_release"
        \ --ignore .o
        \ --ignore .a
        \ --ignore .so
        \ -g ""'

  "      \ --ignore .git
  "      \ --ignore .svn
  "      \ --ignore .hg
  "      \ --ignore .DS_Store
  "      \ --ignore .pyc
else
" ag 没有的时候生效
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|svn|deps)$',
                \ 'file': '\v\.(fcg|bin|out|beam|pyc|o|so|a|jar|log|bak|docx|jpeg|gif|png|jpg|tar|gz|tgz|zip|swp)$',
                \ 'link': '',
                \ }
endif

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
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
Bundle 'powerline/powerline'



" 替换 包围的字符， 比如 把 "abc" 换成 'abc'
Bundle 'tpope/vim-surround'

Bundle 'vim-misc'

" protobuf 编辑
Bundle 'uarun/vim-protobuf'


"ide

"erlang
Bundle 'jimenezrick/vimerl'

"C++
"Bundle 'c.vim'

"c++ 高亮语法显示
Bundle 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1

Bundle 'FSwitch'
nnoremap <space>a :FSHere<cr>

"c 语言
Bundle 'CRefVim'

"stl 
Bundle 'stlrefvim'

"WebDav
Bundle 'Zopedav'

Bundle "SuperTab"

" 可以 对多行 赋值= 进行对齐
Bundle 'godlygeek/tabular'

" tmux 导航支持
"Plugin 'christoomey/vim-tmux-navigator'


"Bundle 'vimprj'
"python
"js
Bundle 'othree/yajs.vim'
Bundle 'pangloss/vim-javascript'


"extended % matching for HTML, LaTeX, and many other languages 
Bundle 'matchit.zip'

" astyle format 格式化
Bundle 'Chiel92/vim-autoformat.git'
let g:formatprg_cs = "astyle --style=google"

"配色
Bundle 'tomasr/molokai.git'

"Bundle 'jlanzarotta/bufexplorer'

Bundle 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" 多个光标
Bundle 'terryma/vim-multiple-cursors'


Bundle 'Shougo/neoyank.vim'

" 多个拷贝
" Bundle 'Shougo/neomru.vim'
" Bundle 'Shougo/unite-outline'
" Bundle 'Shougo/vimproc.vim', {'do':'make'}
" Bundle 'Shougo/unite.vim'
" let g:unite_source_grep_command = 'ag'
" let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
" let g:unite_source_grep_recursive_opt = ''
" let g:unite_split_rule = "botright"
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" nnoremap <space>u :Unite -start-insert<cr>
" nnoremap <space>p :Unite -start-insert file buffer file_mru bookmark<cr>
" nnoremap <space>e :Unite -buffer-name=files -start-insert file<cr>
" nnoremap <space>r :Unite -buffer-name=mru -start-insert file_mru<cr>
" nnoremap <space>j :Unite -buffer-name=jump -start-insert jump<cr>
" "多文件查找
" nnoremap <space>/ :Unite -start-insert grep:.<cr>
" nnoremap <space>g/ :Unite -start-insert grep:/root/gwgo/source/<cr>
" "管理buffer
" nnoremap <space>l :Unite -start-insert buffer<cr>
" let g:unite_source_history_yank_enable = 1
" nnoremap <space>y :Unite -buffer-name=yank history/yank<cr>
" nnoremap <space>o :Unite -buffer-name=outline outline<cr>
" nnoremap <space>b :Unite -buffer-name=bookmark bookmark<cr>
"
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction



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

" set ignorecase 搜索的时候 忽略大小写, 但会影响补全, set infercase 可以避免
set ignorecase
"使用 wildignorecase 也可以防止哦 
"set wildignorecase
set infercase

set autoindent
set smartindent
set incsearch

set backspace=indent,eol,start
syntax enable
syntax on

set background=dark
let g:rehash256 = 1
set t_Co=256
colorscheme desert
let g:syntastic_warning_symbol = 'W'
let g:syntastic_error_symbol = 'E'
"高亮显示光标所在的行
set cursorline


set tags=tags,../tags,../../tags;../../../tags;../../../../tags
set foldmethod=syntax
set foldlevel=99
"默认关闭折叠
set nofoldenable


set path=.,/usr/include,./include,./inc,./incl,../include,../inc,../incl,


set number
set hlsearch

set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,gb18030,latin1 termencoding=utf-8

set backupdir=~/backup/,.
set directory=~/backup/,.

nnoremap ; :

nnoremap q; q:

" command mode like emacs
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>


"for ejs template 
au BufNewFile,BufRead *.ejs set filetype=html


" if  has("cscope")
"   set csto=1
"   set cst
"   set nocsverb
"   set cscopequickfix=s-,c-,d-,i-,t-,e-
"   set csverb
"     " 查找 C 符号
"     nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"
"     " 查找定义
"     nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
"
"     " 看谁调用了这个函数
"     nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"
"     "查找 这个函数调用了哪些函数
"     nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"
"     " 查找字符串
"     nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"
"     " egrep 方式查找 文本
"     nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"
"     "查找这个文件
"     nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"
"     "查找 谁包含了这个文件
"     nmap <leader>gi :cs find i <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"
" "auto load cscope from root dir
" function! LoadCscope()
"     let cur_dir = expand('%:p:h')
"     let db = findfile("cscope.out", cur_dir . ";")
"     if (!empty(db))
"         let path = strpart(db, 0, match(db, "/cscope.out$"))
"         set nocscopeverbose " suppress 'duplicate connection' error
"         exe "cs add " . db . " " . path
"         set cscopeverbose
"     endif
" endfunction
" command LoadCscope call LoadCscope()
" call LoadCscope()
" endif

function! Blade_build_fast()
    exe "Blade build -pdebug"
endfunction
command Bb call Blade_build_fast()
map <F5> <Esc>:Bb<CR>

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

set autochdir

"you spectial define
if filereadable(expand("~/my.vimrc"))
    source ~/my.vimrc
endif
augroup filetype
    autocmd! BufRead,BufNewFile BUILD set filetype=blade
augroup end

autocmd BufRead,BufNewFile *.h set filetype=cpp

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

function! My_h_header_setting()
    set filetype=cpp
    let b:fswitchdst  = 'cpp,c'
    let b:fswitchlocs = 'reg:/include/src/,reg:/include.*/src/,../src,./src'
endfunction

function! My_cpp_setting()
    let b:fswitchdst  = 'h'
    let b:fswitchlocs = 'reg:/src/include/,reg:|src|include/**|,../include,../incl/,..'
endfunction

" 把 .h 设置成 c++语言
autocmd BufNewFile,BufReadPost *.h call My_h_header_setting()
autocmd BufNewFile,BufReadPost *.cpp call My_cpp_setting()

"保存文件的上一次位置, 好神奇， 没看明白
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
