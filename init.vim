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
set nowritebackup

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


" for text manipulation {{{
Plug 'jiangmiao/auto-pairs'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'rbonvall/vim-textobj-latex', {'for': ['tex']}
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_join_mapping = 'J'
nnoremap S :SplitjoinSplit<CR>
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>W <Plug>(easymotion-overwin-f)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1
" }}}

" window manipulation {{{
" Plug 'benmills/vimux'
" nnoremap <C-y> :VimuxPromptCommand <CR>
" nnoremap <C-c> "vyip}:VimuxRunCommand @v<CR>
" nnoremap <C-x> :VimuxCloseRunner<CR>
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
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=Black
autocmd BufWritePre * StripWhitespace
" }}}

" for fomatting and syntax checking {{{
Plug 'Chiel92/vim-autoformat'
nmap <Leader><Leader><Leader> :Autoformat<CR>
let g:autoformat_verbosemode = 1

Plug 'neomake/neomake'
" autocmd! BufWritePost * Neomake

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_cpp_enabled_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
" }}}
let g:neomake_error_sign = {'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '', 'texthl': 'NeomakeWarningSign'}
let g:neomake_info_sign = {'text': '', 'texthl': 'NeomakeInfoSign'}
hi NeomakeErrorSign     ctermfg=Red
hi NeomakeWarningSign   ctermfg=Yellow
hi NeomakeInfoSign      ctermfg=Green

" denite and magit {{{
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'jreybert/vimagit'
Plug 'derekwyatt/vim-fswitch'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim'

nnoremap <C-f> :CtrlSF<Space>
let g:ctrlp_map = '<Leader>fw'
let g:ctrlp_working_path_mode = 'a'

" nnoremap <Leader>fw :Denite file_rec<CR>
nnoremap <Leader>bw :Denite buffer<CR>
nnoremap <Leader>tt :Denite outline<CR>

"}}}

" for completion {{{
Plug 'ervandew/supertab'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/echodoc.vim'
Plug 'mattn/emmet-vim'
Plug 'sukima/xmledit', {'for': ['html', 'xml']}
" Plug 'alvan/vim-closetag'
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:user_emmet_install_global = 0
autocmd Filetype html EmmetInstall
let g:user_emmet_leader_key = '<C-k>'



Plug 'zchee/deoplete-jedi', {'for': ['python'], 'do': 'pip install --user jedi'}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java']}
Plug 'eagletmt/neco-ghc', {'for': ['haskell']}
Plug 'bitc/vim-hdevtools', {'for': ['haskell']}
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h']}
let g:deoplete#sources#clang#debug = v:true
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript'], 'do': 'npm install -g tern'}
Plug 'mhartington/nvim-typescript', {'for': ['typescript'], 'do': 'npm install -g typescript'}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
Plug 'Shougo/neoinclude.vim'
" }}}

" folding
Plug 'Konfekt/FastFold'

" call for tags
Plug 'majutsushi/tagbar'

" snippet and file types {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger='<C-k>'
let g:UltiSnipsJumpForwardTrigger='<C-k>'
let g:UltiSnipsJumpBackwardTrigger=''
let g:UltiSnipsSnippetsDir='~/.config/nvim/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories=['vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit = 'horizontal'

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
" let g:neosnippet#snippets_directory='~/.config/nvim/vim-snippets/snippets'
" syntax section
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chrisbra/csv.vim', {'for': ['csv']}
Plug 'arakashic/chromatica.nvim', {'for': ['c++']}
let g:polyglot_disabled = ['tex', 'typescript']
let g:vim_markdown_math = 1
let g:jsx_ext_required = 1
let g:haskell_indent_disable = 1
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

Plug 'chrisbra/NrrwRgn'
command! -nargs=* -bang -range -complete=filetype NN
            \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
            \ | set filetype=<args>

" Plug 'Quramy/vim-js-pretty-template'
" autocmd BufNewFile,BufEnter *.component.ts JsPreTmpl html
" autocmd BufNewFile,BufEnter *.component.ts syn clear foldBraces

Plug 'dzeban/vim-log-syntax'
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'xml']}
Plug 'chrisbra/Colorizer', {'for': ['vim', 'css', 'html']}
let g:colorizer_auto_filetype = 'css,html'
Plug 'vim-scripts/XML-Folding', {'for': ['html', 'xml']}
" }}}

" writing documentation {{{
" Plug 'mtth/scratch.vim'
Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown', 'notes']}
let g:table_mode_corner="|"
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
Plug 'git@github.com:DarwinSenior/vim-notes.git', {'branch': 'development'}
Plug 'utl.vim'
nnoremap gx :Utl<CR>
Plug 'VOoM'
let g:notes_directories = ['~/workspace/notes/notefiles']
let g:notes_tab_indents = 0
let g:notes_suffix = '.notes'
let g:notes_smart_quotes = 0
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'notes']}
Plug 'junegunn/limelight.vim', {'for': ['markdown', 'notes']}
Plug 'reedes/vim-pencil', {'for': ['markdown', 'notes']}
function! s:goyo_enter()
    set scrolloff=999
    set background=light
    set spell
    call deoplete#disable()
endfunction
function! s:goyo_leave()
    set scrolloff=5
    set nospell
    call deoplete#enable()
endfunction
" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" for appearance {{{

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#nrrwrgn#enabled = 1

" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/seiya.vim'
Plug 'jszakmeister/vim-togglecursor'
Plug 'crusoexia/vim-monokai'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify'
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
" this will enable the vim to be transparent for the background
" let g:seiya_auto_enable = 1
" }}}

" utilities {{{
Plug 'diepm/vim-rest-console'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" }}}
let g:ranger_map_keys = 0

let g:envimdevtools_customcss = '~/.config/nvim/custom.css'
Plug '~/workspace/envim-tools'
Plug '~/workspace/envim-capture'
call plug#end()
filetype plugin indent on
set conceallevel=2
syntax on

colorscheme monokai
set background=dark

hi link deniteMatchedChar String

autocmd BufNewFile,BufRead *.muttrc setfiletype muttrc

" folding {{{
function! FoldText()
    let l:lpadding = &foldcolumn
    redir => l:signs
    execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~# 'id=' ? 2 : 0

    if exists('+relativenumber')
        if (&number)
            let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        elseif (&relativenumber)
            let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
        endif
    else
        if (&number)
            let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction
augroup folding
    autocmd!
    autocmd BufEnter * set foldlevelstart=99
    autocmd BufEnter * set foldnestmax=10
    autocmd BufEnter * set foldtext=FoldText()
augroup END
" }}}
