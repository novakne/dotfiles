setlocal textwidth=80
nmap <buffer> <silent> <LocalLeader>p <Plug>MarkdownPreviewToggle

command! Gmd :grep '^\#+\s\w+$' " Grep headers
command! GToc :!toc -p %         " Genrerate TOC

