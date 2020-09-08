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
" tab
set expandtab
set tabstop=2
set shiftwidth=2

set list
set listchars=tab:\|\ ,trail:▫

" backspace
set backspace=indent,eol,start

" prevent incorrect backgroung rendering
let &t_ut=''

" setup
syntax on
set hidden
set number
set relativenumber
set ruler
set cursorline
set linebreak

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
noremap ; :

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

" prevent auto wrapping
set wrap
set tw=0

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
noremap = nzz
noremap - Nzz

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

" change cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

call plug#begin('~/.vim/plugged')
" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree'

" auto
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'

" ui
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

" util
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

call plug#end()

" color
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color gruvbox

" git
let g:gitgutter_map_keys = 0
nnoremap gp :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>

" fzf
noremap <C-p> :Files<CR>
noremap <C-h> :History<CR>

" coc
let g:coc_global_extensions = ['coc-vimlsp', 'coc-clangd']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

