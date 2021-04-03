setlocal textwidth=80
nmap <buffer> <silent> <LocalLeader>p <Plug>MarkdownPreviewToggle

command! Gmd :grep '^\#+\s\w+$' " Grep headers
command! Toc :!toc -p %         " Genrerate TOC

