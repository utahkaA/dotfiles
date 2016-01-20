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

if has('vim_starting')
    if &compatible
        set nocompatible    " Be iMproved
    endif

    " Required
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundled here:
" Refer to |:NeoBundle-examples|.
" Note: You dont set neobundle setting in .gvimrc!

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" --- NeoBundle Plugins ---
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sudo.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'

call neobundle#end()

nnoremap <silent><C-e> :NERDTreeToggle<CR>

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'readonly': '%{&readonly?"x":""}',
    \ }
    \ }
set laststatus=2
" md as markdown, instead of modula2
" autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkdn,mark*} set filetype=markdown

" Disable highlight italic in Markdown
" autocmd MyAutoGroup FileType markdown hi! def link markdownItalic LineNr

nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
