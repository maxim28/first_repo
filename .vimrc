set nocompatible              " be iMproved, required
filetype off                  " required

" plugin settings"{{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'rosenfeld/conque-term'
Plugin 'Yggdroot/indentLine'
Plugin 'mtth/locate.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/unite.vim'
Plugin 'bling/vim-airline'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 't9md/vim-choosewin'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'clones/vim-fuzzyfinder'
Plugin 'yegappan/mru'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'omnicppcomplete'
Plugin 'autocomplpop'
Plugin 'The-NERD-Commenter'
Plugin 'taglist.vim'
call vundle#end()
"}}}

syntax on
filetype plugin indent on

" casual settings"{{{
set ruler
set t_Co=256
set term=xterm-256color
colorscheme desert
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
%retab
set nowrap
set ic       "ignore case when searching
set backspace=indent,eol,start
set incsearch
set hlsearch
set laststatus=2
set history=1000
set showcmd
"set paste
"}}}

"folding settings"{{{
set nofoldenable        "dont fold by default
set foldmethod=marker   "fold by indent
set foldnestmax=10      "deepest fold is 10 levels
set foldlevel=1
let c_no_comment_fold = 1
"}}}

" auto commands"{{{
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"}}}

" CtrlP + smarttabs"{{{
map ff <ESC>:CtrlP .<CR>
map fm <ESC>:CtrlPMRU .<CR>
map fb <ESC>:CtrlPBuffer<CR>
let g:ctrlp_use_caching = 1
let g:ctrlp_user_command = 'find -L %s -type f | grep -v -P "\.o$|\.so$|\.exe$"' " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
let g:ctrlp_max_files = 0  " no limit
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_extensions = ['smarttabs']
"}}}

" nerdtree"{{{
nmap <F5> :NERDTreeToggle<CR>
"}}}

" tagbar"{{{
nmap <F8> :TagbarToggle<CR>
"}}}

" ctags"{{{
set tags=tags
set tags+=./tags
"}}}

" cscope"{{{
if has("cscope")
    set cscopetag
    set csto=1
    if filereadable("cscope.out")
    ¦   cs add cscope.out
    elseif $CSCOPE_DB !=""
    ¦   cs add $CSCOPE_DB
    endif

    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
"}}}

" airline"{{{
let g:Powerline_symbols = "fancy"
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
    let g:airline_symbols.space = "\ua0"
"}}}

let g:acp_enableAtStartup = 1
