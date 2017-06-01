"reasonable settings {{{
set laststatus=2
set wildmenu
set lazyredraw
set showmatch
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set clipboard=unnamed
"}}}


let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:mapleader = ' '
let g:maplocalleader = ','

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
" <Ctrl-l> redraws the screen and removes any search highlihting
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

if (has('termguicolors'))
 set termguicolors
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
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
nmap _ <Plug>VinegarUp
autocmd FileType netrw nnoremap <silent> <buffer> <ESC> <C-^>
" }}}

" for appearance {{{
Plug 'crusoexia/vim-monokai'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'darwinsenior/tender.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Plug 'chriskempson/base16-vim'
" Plug 'w0ng/vim-hybrid'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/seiya.vim'
Plug 'kien/rainbow_parentheses.vim'
augroup rainbowparen
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
augroup END
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
function! SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <F2> :call SynStack()<cr>
set background=dark
let g:enable_bold_font = 1
" hi link deniteMatchedChar String
" this will enable the vim to be transparent for the background
" let g:seiya_auto_enable = 1
" }}}

" for text manipulation {{{
Plug 'jiangmiao/auto-pairs'
Plug 'tommcdo/vim-exchange'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-fold'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rbonvall/vim-textobj-latex', {'for': ['tex']}
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
let g:splitjoin_join_mapping = 'J'
nnoremap S :SplitjoinSplit<CR>
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
map gw <Plug>(easymotion-bd-w)
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
nmap <silent> <C-w><C-w> <Plug>GoldenViewPrevious
nmap <silent> <C-w>s <Plug>GoldenViewSplit
" }}}

" non-intrusive plugins {{{
Plug 'rbgrouleff/bclose.vim'
Plug 'google/vim-searchindex'
Plug 'benjifisher/matchit.zip'
Plug 'sickill/vim-pasta'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'airblade/vim-gitgutter'
Plug 'danro/rename.vim'
Plug 'ntpeters/vim-better-whitespace'
highlight ExtraWhitespace ctermbg=Black
autocmd BufWritePre * StripWhitespace
" }}}

" syntax check and autoformat {{{
Plug 'Chiel92/vim-autoformat'
nmap <Leader><Leader><Leader> :Autoformat<CR>
let g:autoformat_verbosemode = 1

Plug 'w0rp/ale'
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_linters = {}
nmap <silent> [l <Plug>(ale_previous_wrap)
nmap <silent> ]l <Plug>(ale_next_wrap)

" }}}

" navigation {{{
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'jreybert/vimagit'
Plug 'derekwyatt/vim-fswitch'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <C-f> :CtrlSF<Space>
nnoremap <Leader>fw :FZF<CR>

nnoremap <Leader>bw :Denite buffer<CR>
nnoremap <Leader>tt :Denite outline<CR>

"}}}

" completion {{{
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neopairs.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neoinclude.vim'
Plug 'ujihisa/neco-look', {'for': ['markdown', 'txt', 'tex']}
Plug 'Shougo/echodoc.vim'
Plug 'autozimu/LanguageClient-neovim', {'for': []}
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:LanguageClient_serverCommands = {
            \ 'dart': ['dart_language_server'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'typescript': ['javascript-typescript-stdio'],
            \ 'go': ['go-langserver']
            \}
let g:LanguageClient_autoStart = 1
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

Plug 'zchee/deoplete-zsh'
Plug 'zchee/deoplete-jedi', {'for': ['python'], 'do': 'pip install --user jedi'}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java']}
Plug 'eagletmt/neco-ghc', {'for': ['haskell']}
Plug 'bitc/vim-hdevtools', {'for': ['haskell']}
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': ['go']}
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'
Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'h']}
let g:deoplete#sources#clang#debug = v:true
Plug 'carlitux/deoplete-ternjs', {'for': ['javascript'], 'do': 'npm install -g tern'}
Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'vim'], 'do': 'npm install -g typescript'}
Plug 'racer-rust/vim-racer', {'for': ['rust']}
let g:racer_experimental_completer = 1
" }}}

" folding {{{
Plug 'Konfekt/FastFold'
Plug 'tmhedberg/SimpylFold', {'for': ['python']}
Plug 'vim-scripts/XML-Folding', {'for': ['html', 'xml', 'typescript']}
Plug 'matze/vim-tex-fold', {'for': ['tex']}
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

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, '.', 'x', 'g'))) . l:info
endfunction
augroup folding
    autocmd!
    autocmd BufEnter * set foldlevelstart=99
    autocmd BufEnter * set foldnestmax=10
    autocmd BufEnter * set foldtext=FoldText()
augroup END
" }}}

" tagbar {{{
Plug 'majutsushi/tagbar'
" }}}

" snippet {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'jceb/emmet.snippets'

let g:UltiSnipsExpandTrigger='<C-k>'
let g:UltiSnipsJumpForwardTrigger='<C-k>'
let g:UltiSnipsJumpBackwardTrigger=''
let g:UltiSnipsSnippetsDir='~/.config/nvim/vim-snippets/UltiSnips'
let g:UltiSnipsSnippetDirectories=['vim-snippets/UltiSnips' , 'plug/emmet.snippets/UltiSnips']
let g:UltiSnipsEditSplit = 'vertical'

" }}}

" syntax section {{{
Plug 'SyntaxRange'
" programming languages
Plug 'arakashic/chromatica.nvim', {'for': ['c++', 'c']}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c++']}
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css']}
Plug 'othree/yajs.vim', {'for': ['javascript']}
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript']}
Plug 'kh3phr3n/python-syntax', {'for': ['python']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'cespare/vim-toml', {'for': ['toml']}
let g:rust_fold = 1
let g:python_highlight_all = 1
let g:chromatica#enable_at_startup=1
let g:jsx_ext_required = 1
" text files
Plug 'plasticboy/vim-markdown', {'for': ['markdown']}
Plug 'lervag/vimtex', {'for': ['tex']}
" config files
Plug 'chiphogg/vim-prototxt', {'for': ['prototxt']}
Plug 'PotatoesMaster/i3-vim-syntax', {'for': ['i3']}
Plug 'stephpy/vim-yaml', {'for': ['yaml']}
Plug 'elzr/vim-json', {'for': ['json']}
Plug 'dzeban/vim-log-syntax', {'for': ['log']}
Plug 'chrisbra/csv.vim', {'for': ['csv']}
let g:vim_markdown_math = 1

Plug 'chrisbra/NrrwRgn'
command! -nargs=* -bang -range -complete=filetype NN
            \ :<line1>,<line2> call nrrwrgn#NrrwRgn('',<q-bang>)
            \ | set filetype=<args>
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'xml', 'typescript', 'javascript']}
Plug 'chrisbra/Colorizer', {'for': ['vim', 'css', 'html']}
let g:colorizer_auto_filetype = 'css,html'
" }}}

" writing documentation {{{
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
Plug 'VOoM'
let g:notes_directories = ['~/workspace/notes/notefiles']
let g:notes_tab_indents = 0
let g:notes_suffix = '.notes'
let g:notes_smart_quotes = 0
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'notes']}
function! s:goyo_enter()
    silent call deoplete#disable()
    set spell
endfunction
function! s:goyo_leave()
    silent call deoplete#enable()
    set nospell
endfunction
augroup goyogroup
    autocmd!
    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup end
Plug 'junegunn/limelight.vim', {'for': ['markdown', 'notes']}
Plug 'reedes/vim-pencil', {'for': ['markdown', 'notes']}
" }}}

" utilities {{{
Plug 'diepm/vim-rest-console'
Plug 'sunaku/vim-dasht'
Plug 'bfredl/nvim-ipy', {'for': ['python', 'vim']}
let g:nvim_ipy_perform_mapping = 0
" }}}

let g:envimdevtools_customcss = '~/.config/nvim/custom.css'
Plug '~/workspace/envim-tools'
Plug '~/workspace/envim-capture'
call plug#end()
filetype plugin indent on
syntax on

colorscheme material_bright
autocmd BufNewFile,BufRead *.muttrc setfiletype muttrc

