call pathogen#infect()
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set shm=atI                " Disable intro screen
set lazyredraw             " Don't redraw screen during macros
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
set mousemodel=popup
set nu
set ruler
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set scrolloff=1
syntax on
set hlsearch
set background=light

if has("gui_macvim")
    color solarized
    call togglebg#map("<F7>")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R
    set guioptions-=r
    set guioptions-=e
    set guioptions+=c
    set guifont=Menlo:h14
else
    set t_Co=256
    let g:solarized_termtrans = 1
    let g:solarized_termcolors=256
    color solarized
endif

set nobackup       " no backup files 
set nowritebackup  " only in case you don't want a backup file while editing 
set noswapfile     " no swap files 
set pastetoggle=<F2>
set cursorline

" vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.beam,_build                     " Erlang/Elixir
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a  " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe       " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" viewdoc
let g:viewdoc_openempty=0

" Taboo
let g:taboo_tab_format = " %p "

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

imap <F9> <Esc>:TagbarToggle <CR>i
map <F9> :TagbarToggle <CR>

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
"autocmd FileType erlang compiler erlang
"autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

autocmd FileType gitcommit setlocal spell

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

" for vimerl
let g:erlang_completion_grep="zgrep"
let g:erlang_man_extension="erl\.gz"
let erlang_show_errors = 0
let erlang_keywordprg = "man"

" for syntastic
"let g:syntastic_check_on_open = 1
let syntastic_auto_loc_list = 2
let syntastic_mode_map      = {'mode': 'passive'}

" for tagbar
let g:tagbar_compact = 1

" for nerdtree
let NERDTreeDirArrows=0
