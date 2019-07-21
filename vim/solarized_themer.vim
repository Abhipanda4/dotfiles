  if &background == 'dark'

  let s:shade0 = "#000000"
  let s:shade1 = "#268bd2"
  let s:shade2 = "#87afaf"
  let s:shade3 = "#af8700"
  let s:shade4 = "#af5f00"
  let s:shade5 = "#ff8700"

  let s:accent0 = "#e4e4e4"
  let s:accent1 = "#b2b2b2"
  let s:accent2 = "#808080"
  let s:accent3 = "#9e9e9e"
  let s:accent4 = "#3a3a3a"
  let s:accent5 = "#101010"

  endif

  if &background == 'light'

  let s:shade0 = "#fdf6e3"
  let s:shade1 = "#eee8d5"
  let s:shade2 = "#93a1a1"
  let s:shade3 = "#839496"
  let s:shade4 = "#657b83"
  let s:shade5 = "#586e75"
  let s:shade6 = "#073642"
  let s:shade7 = "#002b36"
  let s:accent0 = "#dc322f"
  let s:accent1 = "#cb4b16"
  let s:accent2 = "#b58900"
  let s:accent3 = "#859900"
  let s:accent4 = "#2aa198"
  let s:accent5 = "#268bd2"
  let s:accent6 = "#6c71c4"
  let s:accent7 = "#d33682"

  endif

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:accent5, s:shade1 ], [ s:accent2, s:shade2 ] ]
  let s:p.normal.middle = [ [ s:accent1, s:shade0 ] ]
  let s:p.normal.right = [ [ s:accent2, s:shade5 ], [ s:accent2, s:shade2 ], [ s:shade0, s:accent1 ] ]
  let s:p.normal.error = [ [ s:accent0, s:shade0 ] ]
  let s:p.normal.warning = [ [ s:accent2, s:shade1 ] ]

  let s:p.inactive.left =  [ [ s:accent4, s:accent3 ] ]
  let s:p.inactive.middle = [ [ s:accent3, s:shade0 ] ]
  let s:p.inactive.right = [ [ s:accent4, s:accent3 ], [ s:accent4, s:accent3 ] ]

  let s:p.insert.left = [ [ s:shade0, s:shade3 ], [ s:accent2, s:shade2 ] ]
  let s:p.visual.left = [ [ s:accent0, s:shade4 ], [ s:accent2, s:shade2 ] ]
  let s:p.replace.left = [ [ s:shade1, s:accent1 ], [ s:accent2, s:shade2 ] ]

  let g:lightline#colorscheme#solarized_themer#palette = lightline#colorscheme#fill(s:p)
