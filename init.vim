"{{{ reasonable settings
set laststatus=2
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

" <Ctrl-l> redraws the screen and removes any search highlighting
" <Ctrl-L> remove not only hightlighting but also the term completely

" keymapping {{{
nnoremap Q @q
nnoremap * *#
nnoremap <silent> <C-L> :nohl<CR>
nnoremap <silent> <C-l> :let @/ = ""<CR>
vmap J 5j
vmap K 5k
vmap H 5h
vmap L 5l
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
set foldenable
set foldlevelstart=10
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
let g:goldenview__restore_urule = {
    \   'filetype' : [
    \     ''        ,
    \     'qf'      , 'vimpager', 'undotree', 'tagbar',
    \     'nerdtree', 'vimshell', 'vimfiler', 'voom'  ,
    \     'tabman'  , 'unite'   , 'quickrun', 'Decho' ,
    \     'denite'  , 'scratch'
    \   ],
    \   'buftype' : [
    \     'nofile'  ,
    \   ],
    \   'bufname' : [
    \     'GoToFile'                  , 'diffpanel_\d\+'      ,
    \     '__Gundo_Preview__'         , '__Gundo__'           ,
    \     '\[LustyExplorer-Buffers\]' , '\-MiniBufExplorer\-' ,
    \     '_VOOM\d\+$'                , '__Urannotate_\d\+__' ,
    \     '__MRU_Files__' ,
    \   ],
    \}
nmap <silent> [w <Plug>GoldenViewPrevious
nmap <silent> ]w <Plug>GoldenViewNext
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
if executable('hindent')
    let g:formatdef_haskell_hindent = '"cat | hindent --style gibiansky"'
    let g:formatters_haskell = ['haskell_hindent']
endif
if executable('tidy')
    let g:formatters_html = ['tidy']
endif

Plug 'neomake/neomake'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_vim_enabled_makes = ['vint']
let g:neomake_html_enabled_makers = ['polylint']
let g:neomake_cpp_enabled_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
let g:neomake_rust_enabled_makers = ['cargocheck']
let g:neomake_haskell_enabled_makers = ['hdevtools']
" }}}

" unite and magit {{{
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'
Plug 'jreybert/vimagit'

nmap <Leader>fi :w<CR>:Denite file_rec<CR>
nmap <Leader>bi :w<CR>:Denite buffer<CR>
nmap <Leader>ai :w<CR>:Denite grep<CR>

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '']
"}}}

" for completion {{{
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
inoremap <silent><expr><Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'alvan/vim-closetag'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

Plug 'zchee/deoplete-jedi', {'for': ['python'], 'do': 'pip install --user jedi'}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java']}
Plug 'eagletmt/ghcmod-vim', {'for': ['haskell']}
Plug 'bitc/vim-hdevtools', {'for': ['haskell']}
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h']}
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript'], 'do': 'npm install -g tern'}
Plug 'mhartington/deoplete-typescript', {'for': ['typescript'], 'do': 'npm install -g typescript'}
Plug 'sebastianmarkow/deoplete-rust', {'for': ['rust']}
Plug 'Shougo/neoinclude.vim'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
let g:deoplete#sources#rust#racer_binary = '/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/usr/src/rust/src/'
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
" syntax section
Plug 'sheerun/vim-polyglot'
Plug 'dzeban/vim-log-syntax'
" }}}

" writing documentation {{{
Plug 'mtth/scratch.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dkarter/bullets.vim'
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
    \ 'org',
    \]

Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'junegunn/limelight.vim', {'for': 'markdown'}
Plug 'reedes/vim-pencil', {'for': 'markdown'}
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
" }}}

call plug#end()
filetype plugin indent on

colorscheme monokai
set background=dark

