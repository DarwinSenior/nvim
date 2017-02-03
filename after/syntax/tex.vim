" syn match texTypeStyle '\\textcolor\>'
function! s:colorstyle(name, tcolor, gcolor)
    let l:colorstylename = 'texColor'.a:name.'Style'
    execute 'syn region '.l:colorstylename.' matchgroup=texTypeStyle'.
                \' start="\\textcolor{'.a:name.'}\s*{" matchgroup=texTypeStyle end="}"'.
                \' concealends contains=@texFoldGroup,@Spell'
    execute 'hi '.l:colorstylename.' guifg='.a:gcolor.' ctermfg='.a:tcolor.''
    execute 'syn cluster texColorGroup add='.l:colorstylename
endfunction

" adding underline conceals and highlight
syn match texTypeStyle "\\textul\>"
syn region texUnderlineStyle matchgroup=texTypeStyle start="\\textul\s*{" matchgroup=texTypeStyle end="}" concealends contains=@texUndeGroup,@Spell
hi texUnderlineStyle gui=underline cterm=underline
syn cluster texFoldGroup add=texUnderlineStyle
syn cluster texBoldGroup add=texUnderlineStyle
syn cluster texItalGroup add=texUnderlineStyle
syn cluster texUndeGroup contains=@texFoldGroup

" adding the color text conceals and highlight
call s:colorstyle('red', 'Red', '#F44336')
call s:colorstyle('blue', 'Blue', '#2196F3')
call s:colorstyle('green', 'Green', '#4CAF50')
call s:colorstyle('yellow', 'Yellow', '#FFEB3B')
syn cluster texFoldGroup add=@texColorGroup
syn cluster texBoldGroup add=@texColorGroup
syn cluster texItalGroup add=@texColorGroup
syn cluster texUndeGroup add=@texColorGroup

