setlocal nofoldenable
setlocal foldlevelstart=0

let g:neomake_python_enabled_makers = ['flake8']
autocmd! BufWritePost *.py Neomake
nnoremap gt :TagbarToggle<CR>
map <silent> K <Plug>(IPy-WordObjInfo)
map gx <Plug>(operator-execute-ipython)
map gxx <Plug>(Ipy-Run)
call operator#user#define('execute-ipython', 'OpExecuteIpython')
function! OpExecuteIpython(motion_wise)
    let v = operator#user#visual_command_from_wise_name(a:motion_wise)
    execute 'normal!' '`[' . v . '`]y'
    call IPyRun(@")
endfunction
