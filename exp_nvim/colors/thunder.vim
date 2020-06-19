highlight clear
if exists('syntax_on')
    syntax reset
endif

set t_Co=256
let g:colors_name="thunder"


function! s:SetHighlightGroup(group, guifg, guibg)
    let l:highlight_string = 'highlight ' . a:group . ' '
    let l:highlight_string .= 'guifg=' . a:guifg . ' '
    let l:highlight_string .= 'guibg=' . a:guibg . ' '
    let l:highlight_string .= 'gui=NONE'

    execute l:highlight_string
endfunction

let s:colors = {
    \ 'theme': '#282C34',
    \ 'red': '#E06c75',
    \ 'dark_red': '#BE5046',
    \ 'green': '#98C379',
    \ 'yellow': '#E5C07B',
    \ 'dark_yellow': '#D19A66',
    \ 'blue': '#61AFEF',
    \ 'purple': '#C678DD',
    \ 'cyan': '#56B6C2',
    \ 'white': '#ABB2BF',
    \ 'black': '#181A1F',
    \ 'faded_grey': '#4B5263',
    \ 'dark_grey': '#2C323C',
    \ 'theme_light': '#3E4452',
    \ 'comment_grey': '#5C6370',
    \ 'no_color': 'NONE'
    \ }

let s:theme = s:colors.theme
let s:red = s:colors.red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:faded_grey = s:colors.faded_grey
let s:dark_grey = s:colors.dark_grey
let s:theme_light = s:colors.theme_light
let s:comment_grey = s:colors.comment_grey
let s:no_color = s:colors.no_color


" Set highlight groups as needed
call s:SetHighlightGroup('Comment', s:comment_grey, s:no_color)
call s:SetHighlightGroup('Constant', s:cyan, s:no_color)
call s:SetHighlightGroup('String', s:green, s:no_color)
call s:SetHighlightGroup('Character', s:green, s:no_color)
call s:SetHighlightGroup('Number', s:dark_yellow, s:no_color)
call s:SetHighlightGroup('Boolean', s:dark_yellow, s:no_color)
call s:SetHighlightGroup('Float', s:dark_yellow, s:no_color)
call s:SetHighlightGroup('Identifier', s:red, s:no_color)
call s:SetHighlightGroup('Function', s:blue, s:no_color)
call s:SetHighlightGroup('Statement', s:purple, s:no_color)
call s:SetHighlightGroup('Conditional', s:purple, s:no_color)
call s:SetHighlightGroup('Repeat', s:purple, s:no_color)
call s:SetHighlightGroup('Label', s:purple, s:no_color)
call s:SetHighlightGroup('Operator', s:purple, s:no_color)
call s:SetHighlightGroup('Keyword', s:red, s:no_color)
call s:SetHighlightGroup('Exception', s:purple, s:no_color)
call s:SetHighlightGroup('PreProc', s:yellow, s:no_color)
call s:SetHighlightGroup('Include', s:blue, s:no_color)
call s:SetHighlightGroup('Define', s:purple, s:no_color)
call s:SetHighlightGroup('Macro', s:purple, s:no_color)
call s:SetHighlightGroup('PreCondit', s:yellow, s:no_color)
call s:SetHighlightGroup('Type', s:yellow, s:no_color)
call s:SetHighlightGroup('StorageClass', s:yellow, s:no_color)
call s:SetHighlightGroup('Structure', s:yellow, s:no_color)
call s:SetHighlightGroup('Typedef', s:yellow, s:no_color)
call s:SetHighlightGroup('Special', s:blue, s:no_color)
call s:SetHighlightGroup('SpecialChar', s:blue, s:no_color)
call s:SetHighlightGroup('Tag', s:blue, s:no_color)
call s:SetHighlightGroup('Delimiter', s:blue, s:no_color)
call s:SetHighlightGroup('SpecialComment', s:comment_grey, s:no_color)
call s:SetHighlightGroup('Debug', s:red, s:no_color)
call s:SetHighlightGroup('Underlined', s:red, s:no_color)
call s:SetHighlightGroup('Ignore', s:purple, s:no_color)
call s:SetHighlightGroup('Error', s:purple, s:no_color)
call s:SetHighlightGroup('Todo', s:purple, s:no_color)


call s:SetHighlightGroup("ColorColumn", s:no_color, s:dark_grey)
call s:SetHighlightGroup("Conceal", s:no_color, s:no_color)
call s:SetHighlightGroup("Cursor", s:theme, s:blue)
call s:SetHighlightGroup("CursorIM", s:no_color, s:no_color)
call s:SetHighlightGroup("CursorColumn", s:no_color, s:dark_grey)
call s:SetHighlightGroup("CursorLine", s:no_color, s:no_color)
call s:SetHighlightGroup("Directory", s:blue, s:no_color)
call s:SetHighlightGroup("DiffAdd", s:theme, s:green)
call s:SetHighlightGroup("DiffChange", s:yellow, s:no_color)
call s:SetHighlightGroup("DiffDelete", s:theme, s:red)
call s:SetHighlightGroup("DiffText", s:theme, s:yellow)
call s:SetHighlightGroup("EndOfBuffer", s:theme, s:no_color)
call s:SetHighlightGroup("ErrorMsg", s:red, s:no_color)
call s:SetHighlightGroup("VertSplit", s:black, s:no_color)
call s:SetHighlightGroup("Folded", s:comment_grey, s:no_color)
call s:SetHighlightGroup("FoldColumn", s:no_color, s:no_color)
call s:SetHighlightGroup("SignColumn", s:no_color, s:no_color)
call s:SetHighlightGroup("IncSearch", s:yellow, s:comment_grey)
call s:SetHighlightGroup("LineNr", s:faded_grey, s:no_color)
call s:SetHighlightGroup("CursorLineNr", s:no_color, s:no_color)
call s:SetHighlightGroup("MatchParen", s:blue, s:no_color)
call s:SetHighlightGroup("ModeMsg", s:no_color, s:no_color)
call s:SetHighlightGroup("MoreMsg", s:no_color, s:no_color)
call s:SetHighlightGroup("NonText", s:theme_light, s:no_color)
call s:SetHighlightGroup("Normal", s:white, s:theme)
call s:SetHighlightGroup("Pmenu", s:no_color, s:theme_light)
call s:SetHighlightGroup("PmenuSel", s:theme, s:blue)
call s:SetHighlightGroup("PmenuSbar", s:no_color, s:theme_light)
call s:SetHighlightGroup("PmenuThumb", s:no_color, s:white)
call s:SetHighlightGroup("Question", s:purple, s:no_color)
call s:SetHighlightGroup("QuickFixLine", s:theme, s:yellow)
call s:SetHighlightGroup("Search", s:theme, s:yellow)
call s:SetHighlightGroup("SpecialKey", s:theme_light, s:no_color)
call s:SetHighlightGroup("SpellBad", s:red, s:no_color)
call s:SetHighlightGroup("SpellCap", s:dark_yellow, s:no_color)
call s:SetHighlightGroup("SpellLocal", s:dark_yellow, s:no_color)
call s:SetHighlightGroup("SpellRare", s:dark_yellow, s:no_color)
call s:SetHighlightGroup("StatusLine", s:white, s:dark_grey)
call s:SetHighlightGroup("StatusLineNC", s:comment_grey, s:no_color)
call s:SetHighlightGroup("StatusLineTerm", s:white, s:dark_grey)
call s:SetHighlightGroup("StatusLineTermNC", s:comment_grey, s:no_color)
call s:SetHighlightGroup("TabLine", s:comment_grey, s:no_color)
call s:SetHighlightGroup("TabLineFill", s:no_color, s:no_color)
call s:SetHighlightGroup("TabLineSel", s:white, s:no_color)
call s:SetHighlightGroup("Terminal", s:white, s:theme)
call s:SetHighlightGroup("Title", s:green, s:no_color)
call s:SetHighlightGroup("Visual", s:no_color, s:theme_light)
call s:SetHighlightGroup("VisualNOS", s:no_color, s:theme_light)
call s:SetHighlightGroup("WarningMsg", s:yellow, s:no_color)
call s:SetHighlightGroup("WildMenu", s:theme, s:blue)
