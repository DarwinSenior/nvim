let g:neomake_typescript_tsc_maker =  {
            \ 'args': ['--noEmit'],
            \ 'append_file': 0,
            \ 'errorformat':
            \ '%E%f %#(%l\,%c): error %m,' .
            \ '%E%f %#(%l\,%c): %m,' .
            \ '%Eerror %m,' .
            \ '%C%\s%\+%m'
            \ }
let g:neomake_typescript_enabled_makers = ['tsc']
let g:nvim_typescript#type_info#on_hold = 1
autocmd! BufWritePost *.ts Neomake
setlocal foldlevel=1
setlocal foldlevelstart=2

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
