vim.o.textwidth = 80

vim.cmd [[command! Gmd :grep '^\#+\s\w+$']] -- Grep headers
vim.cmd [[command! Toc :!toc -p %]]         -- Genrerate TOC
vim.cmd [[command! FmtMd :!prettier --tab-width 4 --write %]]
