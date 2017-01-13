if !exists('g:MarkdownLink')
    let g:MarkdownLink = 1
else

python import re
python import sys
python import vim

function! MarkdownLink#nextlink() abort
    return search('\v!?\[.{-}\]\(.{-}\)', 'w')
endfunction

function! MarkdownLink#previouslink() abort
    return search('\v!?\[.{-}\]\(.{-}\)', 'wb')
endfunction

function! MarkdownLink#changelink() abort
    " call MarkdownLink#nextlink()
    if search('\v!?\[.{-}\]\(.{-}\)', 'wc')
python << endOfPython
[_, row, col, _] = vim.eval("getpos('.')")
line = vim.eval("getline(%s)"%row)
line_before = line[:int(col)-1]
line_after = line[int(col)-1:]
m = re.match(r"(!?)\[(.*?)\]\((.*?)\)(.*)$", line_after).groups()
new_link = vim.eval("input('new link: ', '%s')"%m[2])
vim.eval("setline(%s, '%s%s[%s](%s)%s')"%(row, line_before, m[0], m[1], new_link, m[3]))
endOfPython
    endif
endfunction

endif


nnoremap <buffer> ]l :call MarkdownLink#nextlink()<CR>
nnoremap <buffer> [l :call MarkdownLink#previouslink()<CR>
nnoremap <buffer> gl :call MarkdownLink#changelink()<CR>
