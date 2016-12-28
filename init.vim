set laststatus=2
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nocompatible
set clipboard=unnamed
syntax on

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let mapleader = ' '

" I could not fully grasp the navigation techniques
" So, here I just define the keys and hopefully it will
" speed up. Here in normal/visual mode, Capital HKL would jump
" 5 steps ahead instead of 1
" and in the insert mode, I will use <Ctrl>+HJKL for these
" special jumps
nmap H 5h
nmap L 5l
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k
vmap H 5h
vmap L 5l
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" In many terminal emulators the mouse works just fine, so enable it
if has('mouse')
    set mouse=a
endif

" Ignore the cases when searching
" When searching trying to be smart cases
" Hightlight the search result
" Make search like in the mordern browser
set ignorecase
set smartcase
set hlsearch
set incsearch

" <Ctrl-l> redraws the screen and removes any search highlighting
" <Ctrl-L> remove not only hightlighting but also the term completely
nnoremap <silent> <C-L> :nohl<CR>
nnoremap <silent> <C-l> :let @/ = ""<CR>

" some other sensible settings
" map ex mode to last macro
map Q @q

" turn of swap files
set noswapfile
set nobackup
set nowb

" warping
set wrap
set linebreak
set nolist

" folding
set nofoldenable
set foldmethod=indent

set autoread
" The following are the rules for the indentations
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

nnoremap * *#

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if !exists('$TMUX')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

set runtimepath^=~/.config/nvim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.config/nvim/'))
call dein#add('Shougo/dein.vim')
call dein#add('haya14busa/dein-command.vim')
call dein#add('taylor/vim-zoomwin')
" tpope classical plugins

call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-unimpaired')

call dein#add('jreybert/vimagit')
" for appearance
call dein#add('kien/rainbow_parentheses.vim')
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" for text manipulation
call dein#add('cohama/lexima.vim')
call dein#add('tommcdo/vim-exchange')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-textobj-user')
call dein#add('glts/vim-textobj-comment')
call dein#add('rbonvall/vim-textobj-latex')
call dein#add('wellle/targets.vim')
call dein#add('godlygeek/tabular')
call dein#add('easymotion/vim-easymotion')
map <Leader>w <Plug>(easymotion-bd-w)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1


" tmux for the following
call dein#add('benmills/vimux')
nnoremap <C-y> :VimuxPromptCommand <CR>
nnoremap <C-c> "vyip}:VimuxRunCommand @v<CR>
nnoremap <C-x> :VimuxCloseRunner<CR>

" for window manipulation
call dein#add('dyng/ctrlsf.vim')

" for passive plugins
" the following are something I really like
call dein#add('google/vim-searchindex')
call dein#add('tmhedberg/matchit')
" call dein#add('jszakmeister/vim-togglecursor')
call dein#add('jeffkreeftmeijer/vim-numbertoggle')
call dein#add('airblade/vim-gitgutter')
call dein#add('zhaocai/GoldenView.Vim')
let g:goldenview__enable_default_mapping = 0
call dein#add('Yggdroot/indentLine')
call dein#add('danro/rename.vim')
call dein#add('ntpeters/vim-better-whitespace')
highlight ExtraWhitespace ctermbg=Black
autocmd BufWritePre * StripWhitespace

" syntax section
call dein#add('sheerun/vim-polyglot')
call dein#add('dzeban/vim-log-syntax')

" org mode
call dein#add('jceb/vim-orgmode')

" for fomatting and syntax checking
call dein#add('Chiel92/vim-autoformat')
nmap <Leader><Leader><Leader> :Autoformat<CR>
let g:autoformat_verbosemode = 1
if executable('hindent')
    let g:formatdef_haskell_hindent = '"cat | hindent --style gibiansky"'
    let g:formatters_haskell = ['haskell_hindent']
endif
call dein#add('neomake/neomake')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_vim_enabled_makes = ['vint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_html_enabled_makers = ['polylint']
let g:neomake_cpp_enabled_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
let g:neomake_rust_enabled_makers = ['cargocheck']
let g:neomake_haskell_enabled_makers = ['hdevtools']


" Unite for browsing
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('tsukkee/unite-tag')
call dein#add('Shougo/unite-outline')
call dein#add('junegunn/fzf')
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <C-p> :FZF<CR>
nmap <Leader>Fi :w<CR>:Unite file_rec/neovim<CR>i<Down><Up>
nmap <Leader>fi :w<CR>:Unite file<CR>i
nmap <Leader>bi :w<CR>:Unite buffer<CR>i
nmap <Leader>ti :w<CR>:Unite tag<CR>i
nmap <Leader>gi :w<CR>:Unite grep/git<CR><CR>
nmap <Leader>oi :w<CR>:Unite outline<CR>i

if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif


" for completion
call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
call dein#add('Shougo/neopairs.vim')
call dein#add('Shougo/neco-syntax')
call dein#add('Shougo/echodoc.vim')
call dein#add('alvan/vim-closetag')
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

call dein#add('zchee/deoplete-jedi', {'on_ft': ['python']})
call dein#add('eagletmt/ghcmod-vim', {'on_ft': ['haskell']})
call dein#add('bitc/vim-hdevtools', {'on_ft': ['haskell']})
call dein#add('zchee/deoplete-clang', {'on_ft': ['c', 'cpp', 'h']})
call dein#add('carlitux/deoplete-ternjs')
call dein#add('mhartington/deoplete-typescript')
call dein#add('Shougo/neoinclude.vim')
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
" let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm35/3.5.1/lib/llvm-3.5/lib/libclang.dylib'
" let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm35/3.5.1/lib/llvm-3.5/include/clang/'

" folding
call dein#add('Konfekt/FastFold')

" call for tags
call dein#add('bbchung/gtags.vim')

" for snippet
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


" for colour scheme and appearance
call dein#add('chriskempson/vim-tomorrow-theme', {'merged': 0})
call dein#source('vim-tomorrow-theme')
call dein#add('w0ng/vim-hybrid')
call dein#source('w0ng/vim-hybrid')
colorscheme hybrid
set background=dark
" next thing is for writing non-distracting documentation
call dein#add('junegunn/goyo.vim', {'on_ft': ['markdown']})
call dein#add('junegunn/limelight.vim', {'on_ft': ['markdown']})
call dein#add('reedes/vim-pencil', {'on_ft': ['markdown']})
function! s:goyo_enter()
    set scrolloff=999
    set background=light
    Limelight
    call pencil#init({'wrap': 'soft'})
    colorscheme Tomorrow
    set spell
    hi clear SpellBad
    hi SpellBad cterm=bold,undercurl ctermbg=224
endfunction
function! s:goyo_leave()
    set scrolloff=5
    colorscheme Tomorrow-Night
    Limelight!
    call pencil#init({'wrap': 'off'})
    set nospell
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" useful functionality
call dein#add('lambdalisue/vim-gista', {'on_cmd': 'Gista'})
call dein#add('lambdalisue/vim-gista-unite', {
    \ 'depends': 'vim-gista',
    \ 'on_source': 'unite.vim',
    \})
call dein#end()
filetype plugin indent on

" the following line is the current workaround and might need to remove in the
" future
autocmd BufRead,BufNewFile *.jl set filetype=julia
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.tex set filetype=tex

" There are some specific file types indentation
" javascript/python/coffeescript 4 indent
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype haskell setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

if dein#check_install()
    call dein#install()
endif
