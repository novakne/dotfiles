setlocal textwidth=80

nmap <buffer> <silent> <LocalLeader>p <Plug>MarkdownPreviewToggle

" Generates Markdown qf
command! Gmd :grep  '^\#+\s'
command! Gpart :grep '\[{1}\s+\w.*\s+\]{1}$' %

" Genrerate TOC
command! Toc  :!toc -p %
