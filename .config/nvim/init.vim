"Vim Settings
set number
set relativenumber
set shiftwidth=2
set autoindent
set hlsearch
set tw=80
set title
syntax on
colorscheme vim

"Filetype settings
autocmd BufRead,BufNewFile   *.txt set wrap linebreak tw=100
autocmd BufRead,BufNewFile   *.tex set wrap linebreak tw=100

"Vimplug
call plug#begin()
Plug 'preservim/vim-markdown'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'nvimdev/dashboard-nvim'
Plug 'lervag/vimtex'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ap/vim-css-color'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

"Vimtex Settings
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'pdflatex'

"Goyo Settings
function! s:goyo_enter()
	set linebreak
endfunction
function! s:goyo_leave()
	set nolinebreak
endfunction
