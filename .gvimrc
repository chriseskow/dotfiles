set guioptions=egmrLt
set guitablabel=%t
set noantialias
set columns=84
set lines=24

color base16-default
set background=light

if has("gui_macvim")
  set guifont=Source\ Code\ Pro:h12
  set antialias
else
  set guifont=Consolas:h8:cANSI
endif
