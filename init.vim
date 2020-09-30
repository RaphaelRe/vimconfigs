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
set history=9999
set colorcolumn=80
set wildmenu
set mouse=a
set ve+=onemore
colo peachpuff
highlight Normal ctermbg=236
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight CursorColumn ctermbg=0 guibg=lightgrey
highlight Visual ctermbg=0 guibg=lightgrey


autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python3' shellescape(@%, 1)<cr>




call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"code completion
Plug 'zchee/deoplete-jedi'

"nice statusline (use powerline insead?)
Plug 'vim-airline/vim-airline'

"nicer theme for airline
Plug 'vim-airline/vim-airline-themes'

"automatic closing brackets
Plug 'jiangmiao/auto-pairs'

"jedivim
Plug 'davidhalter/jedi-vim'

"Nerdtree
Plug 'scrooloose/nerdtree'

"Send code to terminal
Plug 'jalvesaq/vimcmdline'

"syntax checking
Plug 'neomake/neomake'

"move code snippets
Plug 'matze/vim-move'

"comment plugin
Plug 'preservim/nerdcommenter'


"additional plugin if I eventually use vim for R
"jalvesaq/Nvim-R



call plug#end()



"minimal settings for autocompletion - check :h deoplete-options
let g:deoplete#enable_at_startup = 1

"set python linter
let g:neomake_python_enabled_makers = ['pylint']


"airline theme
let g:airline_theme='sol' 

"disables jedi autocompletion because its slow
let g:jedi#completions_enabled = 0  

"documentation on ctrl d
let g:jedi#documentation_command = "<C-d>"  

"opens interpreter in new console
"let cmdline_external_term_cmd = "konsole -e '%s' &" 

"othher split axis and width for cmdline
let cmdline_vsplit = 1
let cmdline_term_width= 80

"set move sippets on ctrl
let g:move_key_modifier = 'C'

"check code dynamically - is kind of annoying
"call neomake#configure#automake('nrwi', 500)

let cmdline_app           = {}
let cmdline_app['python']   = 'ipython'





" other keybindings
nnoremap <leader>N :NERDTree<cr>
nnoremap <Enter> o<ESC>
"inoremap <C-BS> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"deleting word right of the curser
"inoremap <C-Del> X<Esc>dwi      old version just for documentation
inoremap <C-DEL> <C-Right> <C-w>
nnoremap <C-DEL> ce

"mapping to get at end of line in insert mode
inoremap <C-e> <Esc>$a



"set coding style
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=80 | 
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 

" remap global copy to ctrl-c
vnoremap <C-c> "+y
vnoremap <C-x> "+yx

