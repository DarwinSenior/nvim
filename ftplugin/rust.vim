
let g:deoplete#sources#rust#racer_binary = '/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/usr/src/rust/src/'
nmap gt :TagbarToggle<CR>

nmap K <Plug>(rust-doc)
nmap gd <Plug>(rust-def)
