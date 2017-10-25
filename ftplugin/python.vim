setlocal nofoldenable
setlocal foldlevelstart=0

" let g:ale_linters.python = 'pylint'
" autocmd! BufWritePost *.py Neomake
nnoremap gt :TagbarToggle<CR>
map <silent> K <Plug>(IPy-WordObjInfo)
map gx <Plug>(operator-execute-ipython)
nnoremap gxx Vy:call IPyRun(@")<cr>
nnoremap <C-x><C-c> <Plug>(IPy-Terminate)
nnoremap <C-x><C-x> <Plug>(IPy-Interrupt)
nnoremap <C-x><C-x> :call IPyRun(input('ipython: '))<cr>

call operator#user#define('execute-ipython', 'OpExecuteIpython')
function! OpExecuteIpython(motion_wise)
    let l:v = operator#user#visual_command_from_wise_name(a:motion_wise)
    execute 'normal!' '`[' . l:v . '`]y'
    call IPyRun(@")
endfunction
