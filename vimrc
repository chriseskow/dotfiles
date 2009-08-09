" General
set nocompatible
set mouse=a
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" Control
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=2

" Tabs and indenting
set autoindent
set smartindent
set expandtab
command -nargs=1 Tab set shiftwidth=<args> tabstop=<args> softtabstop=<args>
autocmd FileType * Tab 2
autocmd FileType c,java,python Tab 4
autocmd FileType help,make Tab 8
autocmd FileType make set noexpandtab

" Syntax highlighting and filetypes
syntax on
filetype indent plugin on
color chris

" Visual
set shortmess=I
set number
set title
set ruler
set laststatus=2
set statusline=%<%f\ %h%m%r%=(%l,%c%V)\ %P\ %y
set showcmd
set wildmenu
set list listchars=eol:¬,tab:›·

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

" MacVim specific
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif
