set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" ##############

autocmd FileType gitcommit setlocal spell

set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=R
set guioptions-=r
set guioptions-=e
set guioptions+=c
set guifont=Menlo:h14
set t_Co=256

set shm=atI        " Disable intro screen
set lazyredraw     " Don't redraw screen during macros
set nobackup       " no backup files
set nowritebackup  " only in case you don't want a backup file while editing
set noswapfile     " no swap files
set cursorline
set nu
set ruler
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set scrolloff=1
set hlsearch
syntax on

set mouse=a
set mousehide
set mousemodel=popup
set ttymouse=xterm2

set nofoldenable
set foldmethod=manual

set clipboard=unnamedplus

noremap y "*y
noremap Y "*Y
noremap p "*p
noremap P "*P

" Solarized
syntax enable
set background=light
colorscheme solarized

" NerdTree
imap <F8> <Esc>:NERDTreeToggle <CR>i
map <F8> <Esc>:NERDTreeToggle <CR>
let NERDTreeDirArrows=0

" ACK
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.beam,_build                     " Erlang/Elixir
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Status line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r
set statusline+=%y
set statusline+=%{FugitiveStatusline()}
set statusline+=%*%=%-16(\ %l,%c-%v\ %)%P
