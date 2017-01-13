let g:neomake_typescript_enabled_makers = ['tsc']
autocmd! BufWritePost *.ts Neomake
