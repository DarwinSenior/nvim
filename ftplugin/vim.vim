setlocal foldenable
setlocal foldmethod=marker
setlocal foldlevelstart=0

let g:neomake_vim_enabled_makes = ['vint']
autocmd! BufWritePost *.vim Neomake

