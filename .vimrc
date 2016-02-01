" --- syntax highlight ---
syntax enable
set background=dark
colorscheme monokai

" --- indent ---
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set number
set fileformat=unix

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off
if has('vim_starting')
    if &compatible
        set nocompatible    " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" --- NeoBundle Plugins ---
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'JuliaLang/julia-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \ }
    \ }
set laststatus=2

" --- neocomplcache setting ---
"  Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings
inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
   return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" md as markdown, instead of modula2
" autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkdn,mark*} set filetype=markdown

" Disable highlight italic in Markdown
" autocmd MyAutoGroup FileType markdown hi! def link markdownItalic LineNr

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
