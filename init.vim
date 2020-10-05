"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => System
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup
let mapleader=" "
let &t_ut=''
syntax on
set autochdir
set hidden
set number
set relativenumber
set ruler
set cursorline
set linebreak
set expandtab
set tabstop=2
set shiftwidth=2
set list
set listchars=tab:\|\ ,trail:▫

" jump to last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Terminal
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert | setlocal nonumber norelativenumber signcolumn=no
tnoremap <C-n> <C-\><C-n>
tnoremap <C-o> <C-\><C-n>:q<CR>
let g:terminal_color_0  = '#737c8d'
let g:terminal_color_1  = '#ff637f'
let g:terminal_color_2  = '#3fc56a'
let g:terminal_color_3  = '#f9c858'
let g:terminal_color_4  = '#10b0fe'
let g:terminal_color_5  = '#ff77f8'
let g:terminal_color_6  = '#5fb9bc'
let g:terminal_color_7  = '#fefefe'
let g:terminal_color_8  = '#5c626f'
let g:terminal_color_9  = '#fc2e51'
let g:terminal_color_10 = '#25a45c'
let g:terminal_color_11 = '#ff9369'
let g:terminal_color_12 = '#3475fe'
let g:terminal_color_13 = '#9f7dfe'
let g:terminal_color_14 = '#4483aa'
let g:terminal_color_15 = '#d5ddea'
noremap <LEADER>s :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ; :

noremap s <nop>
noremap S :w<CR>
noremap Q :q<CR>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" prevent auto wrapping
set wrap
set tw=0
au FileType * set fo-=c fo-=r fo-=o

set showcmd
set wildmenu

" search
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set shortmess+=c
set updatetime=1000
noremap <LEADER><CR> :nohlsearch<CR>
noremap - Nzz
noremap = nzz

" insert
noremap h i
noremap H I
inoremap <C-l> <ESC>A

" always show signcolumn
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === Cursor Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remap cursor
noremap i k
noremap k j
noremap j h
noremap gi gk
noremap gk gj

noremap W b

" move faster
noremap I 5k
noremap K 5j

set scrolloff=5

" command line
" cnoremap <C-i> <Up>
" cnoremap <C-k> <Down>
" split windows
map si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sk :set splitbelow<CR>:split<CR>
map sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" move around windows
map <LEADER>w <C-w>w
map <LEADER>i <C-w>k
map <LEADER>k <C-w>j
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

" resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" change to vertical split
noremap sh <C-w>t<C-w>K
" change to horizontal split
noremap sv <C-w>t<C-w>H

" Tab management
noremap tu :tabe<CR>
noremap tj :-tabnext<CR>
noremap tl :tabnext<CR>
noremap tmj :-tabmove<CR>
noremap tml :+tabmove<CR>

call plug#begin('~/.vim/plugged')
" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree'
" highlight
Plug 'RRethy/vim-illuminate'
" auto
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'

" ui
Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'

" Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/eleline.vim'

" util
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-commentary'


call plug#end()

" color
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color deus

" eleline

" === illuminate
let g:Illuminate_delay = 600
hi illuminatedWord cterm=undercurl gui=undercurl

" === git
let g:gitgutter_map_keys = 0
nnoremap gp :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>

" === fzf
noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-h> :History<CR>

" === coc
let g:coc_global_extensions = ['coc-vimlsp', 'coc-json', 'coc-explorer', 'coc-snippets', 'coc-clangd']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap inoremap<silent><expr> <c-o> coc#refresh()
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" diagnostics navigation
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" code uavigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> go <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" preview
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> <LEADER>v :call <SID>show_documentation()<CR>

nmap ff :CocCommand explorer<CR>
