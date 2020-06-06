" Common colors
let s:blue   = [ '#61afef', 75 ]
let s:green  = [ '#98c379', 114 ]
let s:purple = [ '#c678dd', 176 ]
let s:red    = [ '#e06c75', 168 ]
let s:black  = [ '#000000', 180 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if lightline#colorscheme#background() ==# 'light'
  " Light variant
  let s:fg    = [ '#494b53', 238 ]
  let s:bg   = [ '#494b53', 238 ]
  let s:theme = [ '#488488', 238 ]
else
  " Dark variant
  let s:fg    = [ '#cfd7e6', 145 ]
  let s:bg   = [ '#303546', 238 ]
  let s:theme = [ '#242930', 238 ]
endif

" colors are defined in format: FG, BG, STYLE
let s:p.normal.left    = [ [ s:black, s:green, 'bold' ], [ s:fg, s:bg ] ]
let s:p.normal.middle  = [ [ s:fg, s:theme ] ]
let s:p.normal.right   = [ [ s:black, s:green ], [ s:fg, s:bg ] ]

let s:p.insert.left    = [ [ s:black, s:blue, 'bold' ], [ s:fg, s:bg ] ]
let s:p.insert.right   = [ [ s:black, s:blue ], [ s:fg, s:bg ] ]

let s:p.visual.left    = [ [ s:black, s:purple, 'bold' ], [ s:fg, s:bg ] ]
let s:p.visual.right   = [ [ s:black, s:purple ], [ s:fg, s:bg ] ]

let s:p.replace.left    = [ [ s:black, s:red, 'bold' ], [ s:fg, s:bg ] ]
let s:p.replace.right   = [ [ s:black, s:red ], [ s:fg, s:bg ] ]

let s:p.inactive.left   = [ [ s:fg,  s:bg ] ]
let s:p.inactive.middle  = [ [ s:fg, s:theme ] ]
let s:p.inactive.right  = [ [ s:fg, s:bg ] ]

let g:lightline#colorscheme#one#palette = lightline#colorscheme#flatten(s:p)
