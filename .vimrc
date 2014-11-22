" General
set nocompatible
set noswapfile
set fileformat=unix
set splitbelow
set splitright
set clipboard=unnamed
set ttimeoutlen=100 " Make Esc work faster
let mapleader=","

" Initialize pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Control
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=2

" Mouse support
set mouse=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif

" Tabs and indenting
set autoindent
set smartindent
autocmd FileType * set noexpandtab softtabstop=0 shiftwidth=8
autocmd FileType c,cpp,java,python,php,twig,sql,json,html,xml,xsd,dtd,css,scss,sass,javascript,coffee,sh set expandtab softtabstop=4 shiftwidth=4
autocmd FileType ruby,eruby,yaml set expandtab softtabstop=2 shiftwidth=2
autocmd FileType gitcommit set mouse=

" Syntax highlighting and filetypes
syntax on
filetype indent plugin on
color base16-default
set background=dark

autocmd BufNewFile,BufRead */httpd/*.conf set filetype=apache
autocmd BufNewFile,BufRead */nginx/*.conf set filetype=nginx

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
map ,d /^\(<\\|\|\\|=\\|>\)\{7\}/<CR>
map ,s /[[:space:]]\+$/<CR>
map ,S :%s/[[:space:]]\+$//<CR>
map <C-w><C-h> :vertical resize -10<CR>
map <C-w><C-j> :resize +5<CR>
map <C-w><C-k> :resize -5<CR>
map <C-w><C-l> :vertical resize +10<CR>
map ; A;<Esc>
imap <C-l> <Space>=><Space>
cmap %% <C-r>=expand('%:h').'/'<CR>
cmap w!! w !sudo tee > /dev/null %

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
