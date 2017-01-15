" go back to buffer
nnoremap <buffer> gb :3<CR>wwwgf
" nnoremap <buffer> <Leader>td :Note diary<CR>Go* <ESC>:pu=strftime('%Y-%b-%d')<CR>:w<CR>:Note =strftime('%Y-%b-%d')
nnoremap <buffer> gt :Voom markdown<CR>
call pencil#init({'wrap': 'hard', 'autoformat': 1})
set textwidth=72
set nofoldenable
set conceallevel=2

let g:pencil#autoformat_config.notes = {
            \ 'black': [
            \'notesTable[A-Za-z0-9]*', 'Table[A-Za-z0-9]*',
            \'notesCode[A-Za-z0-9]*', 'notesSnippet[A-Za-z0-9]*',
            \'notesBlockQuote[A-Za-z0-9]*'
            \]
            \}
let g:table_mode_syntax = 0

