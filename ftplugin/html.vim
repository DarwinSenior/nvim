let s:exclude_tags_list = [ '\/', '!', 'html', 'head\>', 'body', 'area', 'base', 'br', 'col', 'embed', 'hr', 'img', 'input', 'keygen', 'link', 'menuitem', 'meta', 'param', 'source', 'track', 'wbr', ]
let s:exclude_tags = join(s:exclude_tags_list, '\|')
function! HTMLFolds()
    let l:line = getline(v:lnum)
    " Ignore tags that open and close in the same line
    if l:line =~# '<\(\w\+\).*<\/\1>'
        return '='
    endif
    if l:line =~# '<\%(' . s:exclude_tags . '\)\@!'
        return 'a1'
    endif
    if l:line =~# '<\/\%(' . s:exclude_tags . '\)\@!'
        return 's1'
    endif
    return '='
endfunction
setlocal foldmethod=syntax
setlocal foldexpr=HTMLFolds()
setlocal nofoldenable
setlocal foldlevelstart=10

let g:neomake_html_htmlhint_maker = {
            \ 'exe': 'htmlhint',
            \ 'args': ['--format', 'unix', '--config', '$HOME/.config/nvim/ftplugin/htmlhint.config.json'],
            \ 'errorformat': '%f:%l:%c: %m',
            \}
let g:neomake_html_enabled_makers = ['htmlhint']
let b:fswitchdst = '.css'
let b:fswitchlocs = '.'
autocmd! BufWritePost *.html Neomake
