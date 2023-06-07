syntax enable
set termguicolors
filetype plugin on
set ignorecase hlsearch
set encoding=utf-8
set number 
set scrolloff=6
set noshowmode

set tabstop     =4
set shiftwidth  =4
set softtabstop =4
set expandtab

call plug#begin()
Plug 'towolf/vim-helm'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}
Plug 'rykka/instantrst' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'Rykka/InstantRst'
Plug 'dracula/vim', {'name': 'dracula'}
call plug#end()

" Color Settings
" ------------------------
colorscheme dracula
let g:airline_theme='dracula'

let g:indentLine_char = '⦙'

" CoC Settings
" ------------------------

" Use <CR> to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

