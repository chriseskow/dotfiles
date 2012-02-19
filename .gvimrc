set guioptions=egmrLt
set guitablabel=%t
set noantialias
set columns=84
set lines=24

color solarized
set background=light
let g:solarized_contrast="high"
let g:solarized_visibility="low"
color solarized

if has("gui_macvim")
  set guifont=Consolas:h13
  set antialias
else
  set guifont=Consolas:h8:cANSI
endif
