setlocal nofoldenable
setlocal foldlevelstart=10
setlocal foldmethod=indent

let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost *.py Neomake
nnoremap gt :TagbarToggle<CR>
