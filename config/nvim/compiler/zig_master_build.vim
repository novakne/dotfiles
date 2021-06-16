if polyglot#init#is_disabled(expand('<sfile>:p'), 'zig', 'compiler/zig_build.vim')
  finish
endif

" Vim compiler file
" Compiler: Zig Compiler (zig build)

if exists('current_compiler')
  finish
endif
runtime compiler/zig.vim
let current_compiler = 'zig_build'

let s:save_cpo = &cpo
set cpo&vim


if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

if exists('g:zig_build_makeprg_params')
	execute 'CompilerSet makeprg=zig-master\ build\ '.escape(g:zig_build_makeprg_params, ' \|"').'\ $*'
else
	CompilerSet makeprg=zig-master\ build\ $*
endif

" TODO: anything to add to errorformat for zig build specifically?

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: tabstop=8 shiftwidth=4 softtabstop=4 expandtab