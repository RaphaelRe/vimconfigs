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
"let &colorcolumn=join(range(81,999),",")
set wildmenu
set mouse=a
set ve+=onemore
"colo peachpuff
highlight Normal ctermbg=236
highlight ColorColumn ctermbg=237 guibg=lightgrey
highlight CursorColumn ctermbg=0 guibg=lightgrey
highlight Visual ctermbg=0 guibg=lightgrey


autocmd FileType python nnoremap <buffer> <F9> :exec '!clear;python3' shellescape(@%, 1)<cr>





call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"colorscheme
Plug 'junegunn/seoul256.vim'

"code completion
"Plug 'zchee/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-jedi'

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

" julia plugin
Plug 'JuliaEditorSupport/julia-vim'

"git plugin
Plug 'tpope/vim-fugitive'


"additional plugin if I eventually use vim for R
Plug 'jalvesaq/Nvim-R'

"plugin to handle csv data
Plug 'chrisbra/csv.vim'


call plug#end()



""""""""""""""""auto completion and documentation""""""""""""""""""""""""""
" deoplete autocompletion is faster since it uses async loading
" jedi vim is not so fast but pops description directly
" currently I use jedi vim for documentation on crtl d and other stuff on
" standard bings and deoplete for autocompletion

let g:deoplete#enable_at_startup = 1 " Enabled

" completions via jedi
let g:jedi#completions_enabled = 0 "Disabled

" disabled signatures since this makes nvim freez for short (or long) time
" which can be really annoying
let g:jedi#show_call_signatures = 0

"documentation on ctrl d
let g:jedi#documentation_command = "<C-d>"  


""""""""""""""""set colorscheme""""""""""""""""""""""""""
colorscheme seoul256
"let g:seoul256_background = 233
let g:seoul256_background = 237
set background=dark



"""""""""""""""" linter """"""""""""""""""""""""""
"set python linter
let g:neomake_python_enabled_makers = ['pylint']


"""""""""""""" ariline confiurations """"""""""""""""""""""""""
"airline theme
"let g:airline_theme='sol' 
"let g:airline_theme='jellybeans' 
"let g:airline_theme='base16' 
let g:airline_theme='papercolor' 

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''





""""""""""""""""""""configs for sending code to terminal """"""""""""""""""""
"opens interpreter in new console
"let cmdline_external_term_cmd = "konsole -e '%s' &" 

"othher split axis and width for cmdline
let cmdline_vsplit = 1
let cmdline_term_width= 80

"set move snippets on ctrl
let g:move_key_modifier = 'C'



"check code dynamically - is kind of annoying
"call neomake#configure#automake('nrwi', 500)

" using ipython as python interpreter
let cmdline_app           = {}
let cmdline_app['python']   = 'ipython'
let cmdline_app['julia']   = 'julia'
" I dont know why - but sometimes .jl is interpreted as lisp oO - I never use
" lisp so I am fine
let cmdline_app['lisp']   = 'julia'





""""""""""""""""""""""keymap nerd tree""""""""""""""""""""""
let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <leader>N :NERDTree<cr>




" other keybindings
nnoremap <Enter> o<ESC>

"deleting word right of the curser
"inoremap <C-Del> X<Esc>dwi      old version just for documentation
"inoremap <C-DEL> <C-Right> <C-w>
inoremap <C-DEL> <C-o>dw
"inoremap <C-DEL> <C-o>de
"nnoremap <C-DEL> ce


"unhighlight
nnoremap <F3> :noh <ENTER>


"mapping to get at end of line in insert mode
inoremap <C-e> <Esc>$a
"mapping to get at beginging of line in insert mode
inoremap <C-a> <Esc>0i


" mapping for jumping to the end of the word in insert mode instead of
" begining of the next word
"inoremap <C-Right> <Esc>ea


"faster scroling
nnoremap <S-j> 10j
nnoremap <S-k> 10k

vnoremap <S-j> 10j
vnoremap <S-k> 10k



nnoremap + :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>



"set coding style
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
"    \ set textwidth=80 | 
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


" command to open terminal in new tab WHY DOES THIS NOT WORK
command! Ter :tabnew | :ter 


