" Name: chris
" Description: Vim color scheme for terminals
" Author: Chris Eskow <chriseskow@gmail.com>

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "chris"

" General colors
hi Normal           guifg=#ffffff     guibg=#000000     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi NonText          guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi Cursor           guifg=NONE        guibg=#cc6633     gui=NONE      ctermfg=NONE        ctermbg=black       cterm=NONE
hi LineNr           guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi VertSplit        guifg=#666666     guibg=#666666     gui=NONE      ctermfg=black       ctermbg=black       cterm=NONE
hi StatusLine       guifg=#666666     guibg=#ffffff     gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
hi StatusLineNC     guifg=#ffffff     guibg=#666666     gui=NONE      ctermfg=white       ctermbg=black       cterm=NONE
hi Folded           guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            guifg=NONE        guibg=NONE        gui=BOLD      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#666666     gui=NONE      ctermfg=NONE        ctermbg=black       cterm=NONE
hi SpecialKey       guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi WildMenu         guifg=#666666     guibg=#cccc66     gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
hi PmenuSbar        guifg=#666666     guibg=#ffffff     gui=NONE      ctermfg=black       ctermbg=white       cterm=NONE
hi Error            guifg=#ffffff     guibg=#cc6666     gui=UNDERCURL ctermfg=white       ctermbg=red         cterm=NONE          guisp=#cc6666
hi ErrorMsg         guifg=#ffffff     guibg=#cc6666     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=#ffffff     guibg=#cc6666     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi ModeMsg          guifg=NONE        guibg=NONE        gui=BOLD      ctermfg=NONE        ctermbg=NONE        cterm=NONE

" Vim 7.x specific colors
if version >= 700
  hi CursorLine     guifg=NONE        guibg=NONE        gui=BOLD      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=NONE        gui=BOLD      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi MatchParen     guifg=#ffffff     guibg=#666666     gui=NONE      ctermfg=white       ctermbg=black       cterm=NONE
  hi Pmenu          guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi PmenuSel       guifg=NONE        guibg=NONE        gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
  hi Search         guifg=#666666     guibg=#cccc66     gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
  hi IncSearch      guifg=#666666     guibg=#cccc66     gui=NONE      ctermfg=black       ctermbg=yellow      cterm=NONE
  hi TabLine                                                          ctermfg=NONE        ctermbg=black       cterm=NONE
  hi TabLineFill                                                      ctermfg=NONE        ctermbg=black       cterm=NONE
  hi TabLineSel                                                       ctermfg=NONE        ctermbg=NONE        cterm=BOLD
endif

" Code syntax
hi Comment          guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi Todo             guifg=#cc6666     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Identifier       guifg=#99cc66     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi Function         guifg=#cccc66     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Constant         guifg=#99cc66     guibg=NONE        gui=NONE      ctermfg=green       ctermbg=NONE        cterm=NONE
hi String           guifg=#cc6666     guibg=NONE        gui=NONE      ctermfg=red         ctermbg=NONE        cterm=NONE
hi Number           guifg=#cc66cc     guibg=NONE        gui=NONE      ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Statement        guifg=#6699cc     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi PreProc          guifg=#6699cc     guibg=NONE        gui=NONE      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Type             guifg=#66cccc     guibg=NONE        gui=NONE      ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Special          guifg=#ffffff     guibg=NONE        gui=NONE      ctermfg=white       ctermbg=NONE        cterm=NONE
hi Delimiter        guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi Operator         guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi SpecialChar      guifg=#cccc66     guibg=NONE        gui=NONE      ctermfg=yellow      ctermbg=NONE        cterm=NONE

hi link Character       String
hi link Boolean         Constant
hi link Float           Number
hi link Repeat          Statement
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Statement
hi link Structure       Statement
hi link Typedef         Statement
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special

" Diff
hi DiffAdd                    guifg=#99cc66      guibg=NONE      gui=NONE      ctermfg=green          ctermbg=NONE      cterm=NONE
hi diffAdded                  guifg=#99cc66      guibg=NONE      gui=NONE      ctermfg=green          ctermbg=NONE      cterm=NONE
hi DiffDelete                 guifg=#cc6666      guibg=NONE      gui=NONE      ctermfg=red            ctermbg=NONE      cterm=NONE
hi diffRemoved                guifg=#cc6666      guibg=NONE      gui=NONE      ctermfg=red            ctermbg=NONE      cterm=NONE
hi DiffChange                 guifg=#cccc66      guibg=NONE      gui=NONE      ctermfg=yellow         ctermbg=NONE      cterm=NONE
hi DiffText                   guifg=#666666      guibg=#cccc66   gui=NONE      ctermfg=black          ctermbg=yellow    cterm=NONE

" Ruby
hi rubyRegexp                 guifg=#cc6666      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyRegexpDelimiter        guifg=#cc6666      guibg=NONE      gui=NONE      ctermfg=brown          ctermbg=NONE      cterm=NONE
hi rubyEscape                 guifg=#66cccc      guibg=NONE      gui=NONE      ctermfg=cyan           ctermbg=NONE      cterm=NONE
hi rubyInterpolationDelimiter guifg=#6699cc      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyControl                guifg=#6699cc      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyGlobalVariable         guifg=#6699cc      guibg=NONE      gui=NONE      ctermfg=blue           ctermbg=NONE      cterm=NONE
hi rubyStringDelimiter        guifg=#99cc66      guibg=NONE      gui=NONE      ctermfg=green          ctermbg=NONE      cterm=NONE
hi link rubyClass             Keyword
hi link rubyModule            Keyword
hi link rubyKeyword           Keyword
hi link rubyOperator          Operator
hi link rubyIdentifier        Identifier
hi link rubyInstanceVariable  Identifier
hi link rubyGlobalVariable    Identifier
hi link rubyClassVariable     Identifier
hi link rubyConstant          Type

" Java
hi javaDocSeeTag              guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi javaDocSeeTag              guifg=#666666     guibg=NONE        gui=NONE      ctermfg=black       ctermbg=NONE        cterm=NONE
hi link javaClassDecl         Type
hi link javaScopeDecl         Identifier
hi link javaCommentTitle      javaDocSeeTag
hi link javaDocTags           javaDocSeeTag
hi link javaDocParam          javaDocSeeTag
hi link javaDocSeeTagParam    javaDocSeeTag

" XML
hi link xmlTag                Keyword
hi link xmlTagName            Conditional
hi link xmlEndTag             Identifier

" HTML
hi link htmlTag               Keyword
hi link htmlTagName           Conditional
hi link htmlEndTag            Identifier

" JavaScript
hi link javaScriptNumber      Number

" C#
hi  link csXmlTag             Keyword
