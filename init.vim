"reasonable settings {{{
set laststatus=2
set wildmenu
set lazyredraw
set showmatch
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nocompatible
set clipboard=unnamed
syntax on
"}}}

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let mapleader = ' '

" In many terminal emulators the mouse works just fine, so enable it
if has('mouse')
    set mouse=a
endif

" Ignore the cases when searching {{{
" When searching trying to be smart cases
" Hightlight the search result
" Make search like in the mordern browser
set ignorecase
set smartcase
set hlsearch
set incsearch
" }}}

" keymapping {{{
" <Ctrl-l> redraws the screen and removes any search highlighting
" <Ctrl-L> remove not only hightlighting but also the term completely
nmap S <nop>
nnoremap Q @q
nnoremap * *#
nnoremap <silent> <C-L> :nohl<CR>
nnoremap <silent> <C-l> :let @/ = ""<CR>
vmap J 5j
vmap K 5k
vmap H 5h
vmap L 5l
nnoremap gV `[v`]
" }}}

" turn of swap files
set noswapfile
set nobackup
set nowb

" warping
set wrap
set linebreak
set nolist

set autoread

"{{{ create tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
"}}}


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if !exists('$TMUX')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" folding {{{
function! FoldText()
    let nblines = '['.(v:foldend - v:foldstart + 1).' lines]'
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let line = getline(v:foldstart)
    let comment = strpart(line, 0, w/2) . '...'
    let expansionString = repeat(' ', w-strwidth(nblines)-strwidth(comment))
    return (comment . expansionString . nblines)
endfunction
set foldnestmax=10
set foldtext=FoldText()
" }}}


call plug#begin('~/.config/nvim/plug')
" tpope classical plugins {{{
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
" }}}

" for appearance {{{
" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
Plug 'crusoexia/vim-monokai'
Plug 'kien/rainbow_parentheses.vim'
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
" }}}

" for text manipulation {{{
Plug 'cohama/lexima.vim'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'rbonvall/vim-textobj-latex'
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_join_mapping = 'J'
nnoremap S :SplitjoinSplit<CR>
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
map <Leader>w <Plug>(easymotion-bd-w)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1
" }}}

" window manipulation {{{
Plug('benmills/vimux')
nnoremap <C-y> :VimuxPromptCommand <CR>
nnoremap <C-c> "vyip}:VimuxRunCommand @v<CR>
nnoremap <C-x> :VimuxCloseRunner<CR>
Plug 'dyng/ctrlsf.vim'
Plug 'zhaocai/GoldenView.Vim'
let g:goldenview__enable_default_mapping = 0
nmap <silent> [w <Plug>GoldenViewPrevious
nmap <silent> ]w <Plug>GoldenViewNext
nmap <silent> - <Plug>GoldenViewPrevious
nmap <silent> _ :bnext<CR>
nmap <silent> <C-w><C-w> <Plug>GoldenViewSplit
" }}}

" for undo manipulation {{{
Plug 'sjl/gundo.vim'
nmap gu :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_width = 60
let g:gundo_right = 1
" }}}

" non-intrusive plugins {{{
Plug 'google/vim-searchindex'
Plug 'tmhedberg/matchit'
Plug 'jszakmeister/vim-togglecursor'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'danro/rename.vim'
Plug 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=Black
autocmd BufWritePre * StripWhitespace
" }}}

" for fomatting and syntax checking {{{
Plug 'Chiel92/vim-autoformat'
nmap <Leader><Leader><Leader> :Autoformat<CR>
let g:autoformat_verbosemode = 1
if executable('tidy')
    let g:formatters_html = ['tidy']
endif

Plug 'neomake/neomake'
" autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_cpp_enabled_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
" }}}

" denite and magit {{{
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'
Plug 'jreybert/vimagit'

nmap <Leader>fw :w<CR>:Denite file_rec<CR>
nmap <Leader>bw :w<CR>:Denite buffer<CR>
nmap <Leader>aw :w<CR>:Denite grep<CR>
nmap <Leader>fs :call GoldenView#Split()<CR>:w<CR>:Denite file_rec<CR>
nmap <Leader>bs :call GoldenView#Split()<CR>:w<CR>:Denite buffer<CR>
nmap <Leader>as :call GoldenView#Split()<CR>:w<CR>:Denite grep<CR>

"}}}

" for completion {{{
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'alvan/vim-closetag'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <silent><expr><Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

Plug 'zchee/deoplete-jedi', {'for': ['python'], 'do': 'pip install --user jedi'}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java']}
Plug 'eagletmt/neco-ghc', {'for': ['haskell']}
Plug 'bitc/vim-hdevtools', {'for': ['haskell']}
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h']}
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript'], 'do': 'npm install -g tern'}
Plug 'mhartington/deoplete-typescript', {'for': ['typescript'], 'do': 'npm install -g typescript'}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'Shougo/neoinclude.vim'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
" }}}

" folding
Plug 'Konfekt/FastFold'

" call for tags
Plug 'bbchung/gtags.vim'

" snippet and file types {{{
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.config/nvim/vim-snippets/snippets'
" syntax section
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown', 'json']
Plug 'dzeban/vim-log-syntax'
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'xml']}
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'vim-scripts/XML-Folding', {'for': ['html', 'xml']}
" }}}

" writing documentation {{{
" Plug 'mtth/scratch.vim'
Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown']}
Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
            \ 'markdown',
            \ 'text',
            \ 'gitcommit',
            \ 'scratch',
            \ 'org',
            \ 'notes'
            \]
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'utl.vim'
Plug 'VOoM'
let g:notes_directories = ['~/workspace/notes/']
let g:notes_tab_indents = 0
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'junegunn/limelight.vim', {'for': 'markdown'}
Plug 'reedes/vim-pencil', {'for': 'markdown'}
function! s:goyo_enter()
    set scrolloff=999
    set background=light
    Limelight
    call pencil#init({'wrap': 'soft'})
    colorscheme monokai
    set spell
    hi clear SpellBad
    hi SpellBad cterm=bold,undercurl ctermbg=224
    call deoplete#disable()
endfunction
function! s:goyo_leave()
    set scrolloff=5
    colorscheme monokai
    Limelight!
    call pencil#init({'wrap': 'off'})
    set nospell
    call deoplete#enable()
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

call plug#end()
filetype plugin indent on

colorscheme monokai
set background=dark

hi NeomakeErrorSign     ctermfg=161
hi NeomakeWarningSign   ctermfg=144
hi NeomakeError     ctermfg=161
hi NeomakeWarning   ctermfg=14
hi link deniteMatchedChar String

if executable('ag')
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', [])
    call denite#custom#var('grep', 'default_opts',
                \ ['--nocolor', '--nogroup'])
endif
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#map('insert', '<Down>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<Up>', '<denite:move_to_previous_line>', 'noremap')
