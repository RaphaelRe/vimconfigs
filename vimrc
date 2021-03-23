set nocompatible
filetype on
set number
set ruler
set cursorcolumn
set cursorline
set clipboard=unnamed
syntax enable
set encoding=utf-8
set laststatus=2
set hlsearch
set ignorecase
set incsearch
set smartcase
set title
set history=5000
set colorcolumn=80
set wildmenu
set mouse=a
colo peachpuff
highlight Normal ctermbg=236
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight CursorColumn ctermbg=0 guibg=lightgrey
highlight Visual ctermbg=0 guibg=lightgrey
"16,17,22,23

"shortcut on <F9> for executing whole python file
" imap <F9> <Esc>:w<CR>:!clear;python3 %<CR>
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python3' shellescape(@%, 1)<cr>





" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jalvesaq/vimcmdline'
Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'matze/vim-move'

" alternative to jedi: not that good but faster(?)
"Bundle 'Valloric/YouCompleteMe'



" --------------------------------------

call vundle#end()            " required
filetype plugin indent on    " required

""let python_highlight_all=1
" syntax on


"other shortcuts

let cmdline_external_term_cmd = "konsole -e '%s' &" "opens interpreter in new console

let g:jedi#documentation_command = "<C-d>"  " documentation
let g:jedi#goto_stubs_command = ""  " no need

" for color scheme
let g:seoul256_background = 233
"colo seoul256



"move code on ctrl
let g:move_key_modifier = 'C'


"nerdtree on \ + N
nmap <leader>N :NERDTree<cr>
nmap <C-c> "+y


" enter blank line in normal mode
map <Enter> o<ESC>

" making double brackets/paranthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" remap global copy to ctrl-c
vmap <C-c> "+y
vmap <C-x> "+ydd


noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
"inoremap <C-BS> <C-o>de
"inoremap <C-b> <C-o>db

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 | 
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 




"faster scroling
nnoremap <S-j> 10j
nnoremap <S-k> 10k

vnoremap <S-j> 10j
vnoremap <S-k> 10k

