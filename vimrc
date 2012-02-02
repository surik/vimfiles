call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set shm=atI                " Disable intro screen
"set lazyredraw             " Don't redraw screen during macros
"set ttyfast                " Improves redrawing for newer computers
set nocompatible
set backspace=indent,eol,start
set incsearch
set history=50
set ruler
set showcmd
set incsearch
set ch=1
set mouse=a
set mousehide
set nu
set ruler
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
syntax on
set hlsearch

if has('gui_running')
    set background=dark
    color solarized
    call togglebg#map("<F7>")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R
    set guioptions-=r
    set guioptions-=e
    set guioptions+=c
    set guifont=Consolas\ 11
else
    set t_Co=256
    color sorcerer_mod
endif

set nobackup       " no backup files 
set nowritebackup  " only in case you don't want a backup file while editing 
set noswapfile     " no swap files 
set pastetoggle=<F2>
set cursorline

" clang
let g:clang_debug=1 
let g:clang_use_library=1 
let g:clang_library_path="/usr/local/lib" 
"let g:clang_complete_auto=0

" Keys
" =============================
imap <F4> <Esc>:tabnew<Esc>:e ./<CR> 
map <F4> <Esc>:tabnew<Esc>:e ./<CR>

imap <F5> <Esc> :tabprev <CR>i
map <F5> :tabprev <CR>

imap <F6> <Esc> :tabnext <CR>i
map <F6> :tabnext <CR>

imap <F8> <Esc>:NERDTreeToggle <CR>i
map <F8> <Esc>:NERDTreeToggle <CR>

imap <F9> <Esc>:Tlist <CR>i
map <F9> :Tlist <CR>

call togglebg#map("<F7>")

set fileencoding=utf-8    " set save encoding"
set termencoding=utf-8    " set terminal encoding"
set encoding=utf-8    " set charset translation encoding"
set fileencodings=utf-8,cp1251,cp866

filetype plugin on
filetype indent on
set nofoldenable
set foldmethod=manual
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set completeopt=menu 
autocmd FileType erlang compiler erlang
autocmd FileType erlang set omnifunc=erlangcomplete#Complete
autocmd FileType c compiler gcc
autocmd FileType c set completeopt=menu 

set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%y
set statusline+=%{exists('*fugitive#statusline')?fugitive#statusline():''}
set statusline+=%#ErrorMsg#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
set statusline+=%*%=%-16(\ %l,%c-%v\ %)%P

menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.cp1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
menu Encoding.utf-8 :e ++enc=utf-8<CR>
map <F12> :emenu Encoding.<Tab>

set wildmenu
set wcm=<Tab>

let Tlist_Show_One_File = 1

" Rainbow Parentheses
"imap <F8> <Esc> :RainbowParenthesesToggle <CR>i
"map <F8> :RainbowParenthesesToggle <CR>
"call rainbow_parentheses#LoadRound()
"call rainbow_parentheses#LoadBraces()
"call rainbow_parentheses#LoadSquare()
"call rainbow_parentheses#LoadChevrons()

" for old vimerl
let g:erlangFold=1
let g:erlangCompleteFile="/usr/share/vim/vim73/autoload/erlang_complete.erl"
let g:erlangCheckFile="/usr/share/vim/vim73/compiler/erlang_check.erl"
let g:erlangHighlightErrors=1
let g:erlangCompletionGrep="zgrep"
let g:erlangManSuffix="erl\.gz"
let g:erlangFoldSplitFunction=0
"====================================================================
