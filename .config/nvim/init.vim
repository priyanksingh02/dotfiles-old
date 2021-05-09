" Common Settings
let mapleader=" "

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
"map vv <C-W>v
"map ss <C-W>s
map Q  <C-W>q
nnoremap <leader>o <C-W>o

if exists('g:vscode')
  " VSCode extension

  " Run Find in files for word under cursor in vscode
  nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

  " Vim Commentry
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

else
  " Ordinary neovim

  nnoremap <leader><leader> :nohl<cr>
  " Source vimrc
  nnoremap <leader><cr> :so ~/.config/nvim/init.vim<cr>

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
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mechatroner/rainbow_csv'
  Plug 'gruvbox-community/gruvbox'
  Plug 'tpope/vim-fugitive'
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
  set hidden

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
  "let g:molokai_original = 1
  "colorscheme molokai
  colorscheme gruvbox
  " end: 'tomasr/molokai'

  " start: vim-airline
  let g:airline_theme='simple'
  " end: vim-airline

  " start: NerdTree
  " Start NERDTree when Vim is started without file arguments.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

  nnoremap <Leader>d :NERDTreeToggle<cr>
  nnoremap <silent> <Leader>v :NERDTreeFind<cr>
  " Automatically close NerdTree
  let NERDTreeQuitOnOpen = 1
  " end: NerdTree

  "Remove all trailing whitespace by pressing F5
  nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

  " FZF settings
  nnoremap <silent> <Leader>t :Files<cr>
  nnoremap <silent> <Leader>b :Buffers<CR>
  nnoremap <silent> <Leader>f :Rg<CR>
  " nnoremap <silent> <Leader>/ :BLines<CR>
  nnoremap <silent> <Leader>/ :Lines<CR>
  nnoremap <silent> <Leader>' :Marks<CR>
  nnoremap <silent> <Leader>g :Commits<CR>
  nnoremap <silent> <Leader>H :Helptags<CR>
  nnoremap <silent> <Leader>hh :History<CR>
  nnoremap <silent> <Leader>h: :History:<CR>
  nnoremap <silent> <Leader>h/ :History/<CR>

  " Stop :Rg from matching files names in search
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

  " Use rg instead of grep
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow

endif
