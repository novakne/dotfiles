" ------------------------------------------------
" [ USER FUNCTIONS ]
" ------------------------------------------------
" TODO: Need to port it to lua

function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number -- '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


command! FZFMru call fzf#run({
            \ 'source':  reverse(s:all_files()),
            \ 'sink':    'edit',
            \ 'options': '-m -x +s',
            \ 'down':    '40%' })

function! s:all_files()
    return extend(
                \ filter(copy(v:oldfiles),
                \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
                \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" <https://gist.github.com/romainl/f7e2e506dc4d7827004e4994f1be2df6>
command! -bang -nargs=1 Global lgetexpr filter(map(getline(1,'$'), { key, val -> expand("%") . ":" . (key + 1) . ":1 " . (len(val) > 0 ? val : '  ') }), { idx, val -> expand('<bang>') == '!' ? val !~ '^.\{-}:1 \zs.*' . <q-args> . '.*' : val =~ '^.\{-}:1 \zs.*' . <q-args> . '.*' })

" <https://gist.github.com/romainl/eae0a260ab9c135390c30cd370c20cd7>
function! Redir(cmd, rng, start, end)
    for win in range(1, winnr('$'))
        if getwinvar(win, 'scratch')
            execute win . 'windo close'
        endif
    endfor
    if a:cmd =~ '^!'
        let cmd = a:cmd =~' %'
                    \ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
                    \ : matchstr(a:cmd, '^!\zs.*')
        if a:rng == 0
            let output = systemlist(cmd)
        else
            let joined_lines = join(getline(a:start, a:end), '\n')
            let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
            let output = systemlist(cmd . " <<< $" . cleaned_lines)
        endif
    else
        redir => output
        execute a:cmd
        redir END
        let output = split(output, "\n")
    endif
    vnew
    let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, output)
endfunction

command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
