call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set lazyredraw             " Don't redraw screen during macros
"set ttyfast                " Improves redrawing for newer computers
set nocompatible
set backspace=indent,eol,start
set nobackup
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
    set guifont=Liberation\ Mono\ 10
else
    set t_Co=256
    color sorcerer_mod
endif
set nobackup       " no backup files 
set nowritebackup  " only in case you don't want a backup file while editing 
set noswapfile     " no swap files 
set pastetoggle=<F2>
set cursorline

imap <F4> <Esc>:browse tabnew<CR> 
map <F4> <Esc>:browse tabnew<CR>

imap <F5> <Esc>:tabprev <CR>i
map <F5> <Esc>:tabprev <CR>

imap <F6> <Esc>:tabnext <CR>i
map <F6> <Esc>:tabnext <CR>

imap <F8> <Esc>:NERDTreeToggle <CR>i
map <F8> <Esc>:NERDTreeToggle <CR>

imap <F9> <Esc>:Tlist <CR>i
map <F9> <Esc>:Tlist <CR>

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
