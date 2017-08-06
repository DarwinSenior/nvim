call SyntaxRange#Include('^ *template: `$', '^ *`,$', 'html', 'typescriptObjectLabel')
call SyntaxRange#Include('^ *styles: \[`$', '^ *`\]\?,$', 'css', 'typescriptObjectLabel')
setlocal foldmethod=syntax

syntax clear foldBraces
