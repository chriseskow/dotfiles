" General
set nocompatible
set fileformat=unix
set mouse=a
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set splitbelow
set splitright
set clipboard=unnamed
let mapleader=","
call pathogen#infect()

" Control
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=2

" Tabs and indenting
set autoindent
set smartindent
command -nargs=1 Tab set shiftwidth=<args> tabstop=<args> softtabstop=<args>
command Copy set nopaste nonumber nolist mouse=
command Nocopy set paste number mouse=a
autocmd FileType * Tab 8
autocmd FileType c,java,python,php,html,xml,css,scss,sass,javascript,coffee,jinja Tab 4
autocmd FileType ruby,sh Tab 2
autocmd FileType * set noexpandtab
autocmd FileType c,java,ruby,python,sh set expandtab

" No backups for crontab editing
autocmd FileType crontab set nobackup nowritebackup

" Syntax highlighting and filetypes
syntax on
filetype indent plugin on
color chris

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.twig set filetype=jinja

" Visual
set shortmess=It
set number
set title
set ruler
set laststatus=2
set statusline=%<%f\ %h%m%r%=(%l,%c%V)\ %P\ %y
set wildmode=longest,list,full
set wildmenu
set listchars=eol:…,tab:›.

" Searching
set incsearch
set wrapscan
set hlsearch

" Key mappings
map ,, <C-^>
map ,e :e %%
map ,l :set list!<CR>
map ,s /\s\+$/<CR>
map ,S :%s/\s\+$//<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-w><C-h> :vertical resize -10<CR>
map <C-w><C-j> :resize +5<CR>
map <C-w><C-k> :resize -5<CR>
map <C-w><C-l> :vertical resize +10<CR>
map ; A;<Esc>
imap <C-l> <Space>=><Space>
cnoremap %% <C-r>=expand('%:h').'/'<CR>

" Always move into wrapped lines
nnoremap j        gj
nnoremap <Down>   gj
inoremap <Down>   <C-o>gj
nnoremap k        gk
nnoremap <Up>     gk
inoremap <Up>     <C-o>gk

" Numpad operator keys resize split windows
if bufwinnr(1)
  map <kPlus> <C-w>+
  map <kMinus> <C-w>-
  map <kMultiply> <C-w>>
  map <kDivide> <C-w><
endif

" Move/rename current file
function! MoveFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
command! MoveFile :call MoveFile()

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-n>"
