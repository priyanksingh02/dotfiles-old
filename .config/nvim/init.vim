let mapleader=" "

nnoremap <leader><leader> :nohl<cr>
" Source vimrc
nnoremap <leader><cr> :so ~/.config/nvim/init.vim<cr>

" Paste Remap
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>P "+P
vnoremap <leader>y "+y

" Window Split settings
" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q
nnoremap <leader>o <C-W>o

" Open splits on the right and below
set splitbelow
set splitright

" :PlugInstall
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'tomasr/molokai'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
call plug#end()

" Tab settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
set smartindent
" Enable Mouse
set mouse=a

" vim treat numerals as decimals
" Useful for <C-a> to increment and <C-x> to decrement
set nrformats-=octal

" Scroll Offset
set scrolloff=2

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Numbers
set number
set relativenumber

" Make search case Insensitive
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write file when switching buffers
set autowrite
set autoread

" See help fo
set formatoptions=qrnj1

" List candidates in wildmenu after tabbing, complete longest common part in
" matched results. Tabbing again will trigger selection among the matches.
set wildmode=list:longest,full

" start: 'vimwiki/vimwiki'
let wiki_1 = {}
let wiki_1.path = '~/wiki'
let wiki_1.syntax = 'markdown'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp','bash':'sh' }
let wiki_1.ext = '.md'
let wiki_1.links_space_char = '_'
let g:vimwiki_list = [wiki_1]
" end: 'vimwiki/vimwiki'

" start: 'tomasr/molokai'
let g:molokai_original = 1
colorscheme molokai
" end: 'tomasr/molokai'

" start: vim-airline
let g:airline_theme='simple'
" end: vim-airline

" start: NerdTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <Leader>f :NERDTreeToggle<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<cr>
" Automatically close NerdTree
" let NERDTreeQuitOnOpen = 1
" end: NerdTree

"
