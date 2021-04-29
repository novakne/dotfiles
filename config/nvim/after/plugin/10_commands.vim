" [ User commands ]

" Make current buffer executable
command! Chmodx :!chmod 774 %

" Change to directory of current file
command! Cd :cd %:p:h
command! Cdw :lcd %:p:h
command! Cdt :tcd %:p:h

" Fix Treesitter
command! FixTs write | edit | TSBufEnable highlight

" Grep '[ word ]'
command! Gpart :grep '\[{1}\s+\w.*\s+\]{1}$' %

