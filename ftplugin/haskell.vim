if executable('hindent')
    let g:formatdef_haskell_hindent = '"cat | hindent --style gibiansky"'
    let g:formatters_haskell = ['haskell_hindent']
endif
let g:haskellmode_completion_ghc = 0
setlocal omnifunc=necoghc#omnifunc
nnoremap <buffer> K :HdevtoolsType<CR>
nnoremap <buffer> <C-l> :let @/ = ""<CR>:HdevtoolsClear<CR>

let g:neomake_haskell_enabled_makers = ['hdevtools']
autocmd! BufWritePost *.hs Neomake

