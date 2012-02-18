" General
set nocompatible
set mouse=a
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set splitbelow
set splitright

" Control
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=2

" Tabs and indenting
set autoindent
set smartindent
command -nargs=1 Tab set shiftwidth=<args> tabstop=<args> softtabstop=<args>
command Copy set nonumber nolist mouse=
command Nocopy set number list mouse=a
autocmd FileType * Tab 8
autocmd FileType c,java,python,php Tab 4
autocmd FileType ruby Tab 2
autocmd FileType * set noexpandtab
autocmd FileType c,java,ruby,python set expandtab

" Syntax highlighting and filetypes
syntax on
filetype indent plugin on
color chris

" Visual
set shortmess=It
set number
set title
set ruler
set laststatus=2
set statusline=%<%f\ %h%m%r%=(%l,%c%V)\ %P\ %y
set wildmode=longest,list,full
set wildmenu
set list listchars=eol:…,tab:›·

" Searching
set incsearch
set wrapscan
set hlsearch

" Always move into wrapped lines
nnoremap j        gj
nnoremap <Down>   gj
inoremap <Down>   <C-O>gj
nnoremap k        gk
nnoremap <Up>     gk
inoremap <Up>     <C-O>gk

" Numpad operator keys resize split windows
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kMultiply> <C-W>>
  map <kDivide> <C-W><
endif

" Shortcut to append semicolons to lines
nnoremap ;        A;<Esc>

" MacVim specific
if has("gui_macvim")
  set transparency=10
endif
