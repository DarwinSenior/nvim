
if executable('hindent')
    let g:formatdef_haskell_hindent = '"cat | hindent --style gibiansky"'
    let g:formatters_haskell = ['haskell_hindent']
endif

let g:neomake_haskell_enabled_makers = ['hdevtools']
autocmd! BufWritePost *.hs Neomake haskell
