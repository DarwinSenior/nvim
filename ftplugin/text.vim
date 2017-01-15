let g:neomake_text_languagetools_maker = {
            \ 'exe': 'languagetool',
            \ 'args': [],
            \ 'errorformat': '%E%.%#\Line\ %l\,\ column\ %c\,%.%#,'.
			\ '%ZMessage:\ %m'
            \}
let g:neomake_text_enabled_makers = ['languagetools']
" 9.) Line 76, column 7 , Rule ID: AGREEMENT_SENT_START[3]

