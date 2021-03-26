setlocal textwidth=80

nmap <buffer> <silent> <LocalLeader>p <Plug>MarkdownPreviewToggle

" Generates Markdown qf
command! Gmd :grep  '^\#+\s\w+$'

" Genrerate TOC
command! Toc  :!toc -p %
