let g:neomake_sh_enabled_makers = ['shellcheck']
echo "called"
autocmd! BufWritePost *.sh Neomake
