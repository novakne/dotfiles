setlocal textwidth=80

command! Gmd :grep '^\#+\s\w+$' " Grep headers
command! Toc :!toc -p %         " Genrerate TOC
command! FmtMd :!prettier --tab-width 4 --write %
