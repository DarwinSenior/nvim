"reasonable settings {{{
set laststatus=2
set wildmenu
set lazyredraw
set showmatch
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set clipboard+=unnamedplus
set nowrap
"}}}

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

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
nnoremap gV `[v`]
" }}}

" turn of swap files
set noswapfile
set nobackup
set nowritebackup

" mapping the window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
Plug 'tpope/vim-dispatch'
Plug 'drmingdrmer/vim-toggle-quickfix'
nmap _ <Plug>VinegarUp
nnoremap - :A<cr>
nnoremap <F9> :Dispatch!<CR>
nnoremap <F10> :Copen<CR>
autocmd FileType netrw nnoremap <silent> <buffer> <ESC> <C-^>
" }}}

" for appearance {{{
Plug 'crusoexia/vim-monokai'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#capslock#enabled = 1
" let g:airline#extensions#ale#enabled = 1

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
Plug 'haya14busa/vim-operator-flashy'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rbonvall/vim-textobj-latex', {'for': ['tex']}
Plug 'wellle/targets.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.component.ts,*.vue'
Plug 'rhysd/conflict-marker.vim'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
map gw <Plug>(easymotion-s)
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1
Plug 'justinmk/vim-sneak'
map s <Plug>Sneak_s
map S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
map /  <Plug>(incsearch-forward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map zg/ <Plug>(incsearch-fuzzy-stay)

Plug 'haya14busa/vim-asterisk'
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

" Plug 'maxbrunsfeld/vim-yankstack'

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
let g:gitgutter_map_keys = 0

Plug 'danro/rename.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-matchquote'
highlight ExtraWhitespace ctermbg=Black
autocmd BufWritePre * StripWhitespace
" }}}

" syntax check and autoformat {{{
Plug 'Chiel92/vim-autoformat'
nmap <Leader><Leader><Leader> :Autoformat<CR>
let g:autoformat_verbosemode = 1

" Plug 'w0rp/ale'
" let g:ale_sign_column_always = 1
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
" let g:ale_linters = {}
" nmap <silent> [l <Plug>(ale_previous_wrap)
" nmap <silent> ]l <Plug>(ale_next_wrap)

" }}}

" navigation {{{
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/denite.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'jreybert/vimagit'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <C-f> :CtrlSF<Space>
nnoremap <Leader>fw :FZF<CR>
nnoremap <Leader>fg :GFiles<CR>

nnoremap <Leader>bw :Denite buffer<CR>
nnoremap <Leader>tt :Denite outline<CR>

"}}}

" completion {{{
" Plug 'roxma/nvim-completion-manager'
" Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
Plug 'roxma/nvim-completion-manager'
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-syntax'
Plug 'autozimu/LanguageClient-neovim'
let g:cm_refresh_length = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:LanguageClient_serverCommands = {
            \ 'lua': ['lua-lsp'],
            \ 'dart': ['dart_language_server'],
            \ 'ruby': ['language_server-ruby'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ 'typescript': ['typescript-language-server', '--stdio'],
            \ 'json': ['json-languageserver', '--stdio'],
            \ 'haskell': ['hie', '--lsp'],
            \ 'go': ['go-langserver'],
            \ 'python': ['pyls'],
            \ 'vue': ['vls'],
            \ 'cpp': ['clangd'],
            \}
let g:LanguageClient_autoStart = 1
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" Plug 'mhartington/nvim-typescript', {'for': ['typescript', 'vim'], 'do': 'npm install -g typescript'}
" }}}

" syntax section {{{
Plug 'vim-scripts/SyntaxRange'
" programming languages
Plug 'arakashic/chromatica.nvim', {'for': ['cpp', 'c', 'vim']}
Plug 'jparise/vim-graphql'
let g:chromatica#libclang_path = '/usr/local/opt/llvm/lib'
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'othree/html5.vim', {'for': ['html', 'vue']}
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss', 'vue']}
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'vue'] }
Plug 'digitaltoad/vim-pug', { 'for': ['pug', 'vue'] }
" Plug 'othree/yajs.vim', {'for': ['javascript']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'mxw/vim-jsx', {'for': ['javascript']}
" Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'vue']}
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'vue']}
Plug 'kh3phr3n/python-syntax', {'for': ['python']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'posva/vim-vue', { 'for': ['vue'] }
Plug 'dart-lang/dart-vim-plugin'
Plug 'wavded/vim-stylus'
Plug 'cespare/vim-toml', {'for': ['toml']}
let g:rust_fold = 1
let g:python_highlight_all = 1
let g:chromatica#enable_at_startup=1
let g:jsx_ext_required = 0
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
Plug 'vim-scripts/VOoM'
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
Plug 'zenbro/mirror.vim'
Plug 'bfredl/nvim-ipy', {'for': ['python', 'vim']}
Plug 'jacob-ogre/vim-syncr'
Plug 'metakirby5/codi.vim'
Plug 'parkr/vim-jekyll'
let g:nvim_ipy_perform_mapping = 0
let g:jekyll_post_template = []
let g:jekyll_post_filetype = 'asciidoc'
let g:jekyll_post_extension = '.adoc'
" }}}

call plug#end()
filetype plugin indent on
syntax on

let oceanic_next_terminal_bold = 1
let oceanic_next_terminal_italic = 1
colorscheme OceanicNext
autocmd BufNewFile,BufRead *.muttrc setfiletype muttrc
