call SyntaxRange#Include('^ *template: `$', '^ *`,$', 'html', 'typescriptObjectLabel')
call SyntaxRange#Include('^ *styles: \[`$', '^ *`\]\?,$', 'css', 'typescriptObjectLabel')
call SyntaxRange#Include('const typeDefs = `$', '^ *`;$', 'graphql', 'typescriptObjectLabel')
setlocal foldmethod=syntax

syntax clear foldBraces
