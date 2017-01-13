
if executable('hindent')
    let g:formatdef_haskell_hindent = '"cat | hindent --style gibiansky"'
    let g:formatters_haskell = ['haskell_hindent']
endif
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell nnoremap <buffer> K :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <C-l> :let @/ = ""<CR>:HdevtoolsClear<CR>

let g:neomake_haskell_enabled_makers = ['hdevtools']
autocmd! BufWritePost *.hs Neomake

