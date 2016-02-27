" Maintainer:	Henrique C. Alves (hcarvalhoalves@gmail.com)
" Version:      1.0
" Last Change:	September 25 2008

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustang"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine    guibg=#444466  ctermbg=236
  hi ColorColumn                  guibg=#000005 ctermbg=236
  hi CursorColumn                 guibg=#000005 ctermbg=236
  hi MatchParen    guifg=#d0ffc0  guibg=#2f2f2f gui=bold ctermfg=157 ctermbg=237 cterm=bold
  hi Pmenu		     guifg=#ffffff  guibg=#444444 ctermfg=255 ctermbg=238
  hi PmenuSel		   guifg=#000000  guibg=#b1d631 ctermfg=0 ctermbg=148
endif

" General colors
hi Cursor       guifg=#0000ff guibg=#FFdd00 gui=none ctermbg=241
hi Normal       guifg=#efefef guibg=#000005 gui=none ctermfg=253 ctermbg=234
hi Normal       guifg=#f0f0cc guibg=#000005 gui=none ctermfg=253 ctermbg=234
hi Normal       guifg=#eeeeff guibg=#050510 gui=none ctermfg=253 ctermbg=234
hi Normal       guifg=#eeeeff guibg=#101017 gui=none ctermfg=253 ctermbg=234
hi NonText      guifg=#c0c0c0 guibg=#202030 gui=none ctermfg=244 ctermbg=235
hi LineNr       guifg=#c0c0c0 guibg=#202030 gui=none ctermfg=244 ctermbg=232
hi StatusLine   guifg=#d3d3d5 guibg=#333370 gui=italic,bold ctermfg=253 ctermbg=238 cterm=italic
hi StatusLineNC guifg=#939395 guibg=#444450 gui=none ctermfg=246 ctermbg=238
hi VertSplit    guifg=#444444 guibg=#444450 gui=none ctermfg=238 ctermbg=238
hi Folded       guifg=#dddddd guibg=#101015 gui=none ctermbg=4 ctermfg=248
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold ctermfg=254 cterm=bold
hi Visual       guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=4
hi SpecialKey   guifg=#c0c0c0 guibg=#202020 gui=none ctermfg=244 ctermbg=236

hi EvenLbg guibg=#111122 

" for loops and a few of the autocmd events don't exist in previous versions
if v:version < 700
finish
endif

sign define EvenL linehl=EvenLbg


" Syntax highlighting
hi Comment    guifg=#efefef gui=none   ctermfg=244
hi Todo       guifg=#8f8f8f gui=italic ctermfg=245
hi Boolean    guifg=#b1d631 gui=none ctermfg=148
hi String     guifg=#b1d631 gui=NONE   ctermfg=148
hi Identifier guifg=#b1d631 gui=none ctermfg=148
hi Function   guifg=#ffffff gui=bold ctermfg=255
hi Type       guifg=#faf4c6 gui=none ctermfg=103
hi Statement  guifg=#c0c0c5 ctermfg=103
hi Keyword    guifg=#ff9800 gui=none ctermfg=208
hi Constant   guifg=#ff9800 gui=none  ctermfg=208
hi Number     guifg=#ff9800 gui=none ctermfg=208
hi Special    guifg=#ff9800 gui=none ctermfg=208
hi PreProc    guifg=#faf4c6 gui=none ctermfg=230
hi Todo       guifg=#000000 guibg=#e6ea50 gui=italic

" Code-specific colors
hi pythonOperator guifg=#7e8aa2 gui=none ctermfg=103

" NERDTree colors
hi NERDTreeFile     guifg=#cdd2db ctermfg=250
hi NERDTreeDir      guifg=#a5aebe ctermfg=111
hi NERDTreeUp       guifg=#5b646d ctermfg=62

hi def link NERDTreeOpenable String
hi def link NERDTreeCloseable NERDTreeOpenable
hi def link NERDTreeCWD String
hi def link NERDTreePart String


