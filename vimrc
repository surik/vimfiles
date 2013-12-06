call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set shm=atI                " Disable intro screen
set lazyredraw             " Don't redraw screen during macros
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

if has('gui_running')
    "set background=dark
    color solarized
    call togglebg#map("<F7>")
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=R
    set guioptions-=r
    set guioptions-=e
    set guioptions+=c
    set guifont=Menlo\ 12
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

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.a     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" clang
let g:clang_debug=0 
let g:clang_use_library=1
if has("gui_macvim")
    let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/"
endif
"let g:clang_library_path="/usr/local/lib" 
"let g:clang_complete_auto=0

" viewdoc
let g:viewdoc_openempty=0

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
autocmd FileType erlang compiler erlang
"autocmd FileType erlang set omnifunc=erlangcomplete#Complete
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

function! GenCscope()
    exec "silent! !rm /tmp/cscope.out"
    exec "silent! !cscope -R -b"
    exec "silent! !cp cscope.out /tmp/cscope.out"
    exec "silent! !rm cscope.out"
    exec "silent! cs reset"
    exec "silent! cs add /tmp/cscope.out"
endfunction
function! GenCtags()
    exec "silent! !rm tags"
    exec "silent! !ctags -R --file-scope=no"
    "exec "silent! set tags+=/tmp/tags"
endfunction
au BufWritePost *.c,*.cpp,*.cc,*.cxx,*.h :call GenCscope()
au BufWritePost *.c,*.cpp,*.cc,*.cxx,*.h :call GenCtags()
au BufWritePost *.erl,*.hrl   :call GenCtags()

" CScope (from cscope_maps.vim)
" " Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set cscopetag
    set csto=0
    set cscopeverbose  

    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  
endif
