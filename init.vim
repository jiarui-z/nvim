" === setup
set encoding=utf-8
set nocompatible
set mouse=a
set clipboard+=unnamedplus
let mapleader=" "
set hidden
set autochdir
set wildmenu
set ttm=50
set shortmess+=c " try c-n

" === ui
set termguicolors
set number
set relativenumber
set ruler
set cursorline
set laststatus=2
set wrap
set foldmethod=indent
set foldlevel=99
set nofoldenable
set linebreak
set tw=0
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list lcs=tab:\|\ ,trail:▫
set scrolloff=5
set signcolumn=yes
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" === search
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <leader><CR> :nohlsearch<CR>

" === motion and operator
noremap Y y$
noremap U J
noremap gh ^
noremap gl g_
noremap K 5k
noremap J 5j
noremap zh zH
noremap zl zL

" === tab management
noremap tt :tabe<CR>
noremap th :tabprevious<CR>
noremap tl :tabnext<CR>
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>

" === windows
set splitright
set nosplitbelow
noremap s <nop>
noremap ss :vsplit<CR>
noremap sv :split<CR>
noremap sk <C-w>k
noremap sj <C-w>j
noremap sh <C-w>h
noremap sl <C-w>l
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" === command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>

" === others
noremap <C-d> :bw<CR>
noremap S :w<CR>
noremap Q :q<CR>
noremap <leader>rc :e $MYVIMRC<CR>

" disable continuation of comments
au BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" jump to last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

call plug#begin('~/.config/nvim/plugged')
" ui
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" tabular
" splitjoin
call plug#end()

colo nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" === auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutBackInsert = ''

" === gitgutter
let g:gitgutter_map_keys = 0
nnoremap gp :GitGutterPreviewHunk<CR>
nnoremap g- :GitGutterPrevHunk<CR>
nnoremap g= :GitGutterNextHunk<CR>
nnoremap gu :GitGutterUndoHunk<CR>

" === tcomment_vim
let g:tcomment_opleader1 = '<leader>c'

" ==== vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
map x <Plug>Sneak_s
map X <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" === fzf
noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-h> :History<CR>
noremap <silent> <C-f> :Rg<CR>
