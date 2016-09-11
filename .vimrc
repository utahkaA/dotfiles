set encoding=utf-8
set fileformat=unix
set number " set line number. The command `:set nonumber` hides numbers.
set showcmd

" --- dont make a backup file ---
set nowritebackup
set nobackup
set noswapfile

" --- switche on syntax highlightning ---
syntax enable
colorscheme monokai

" --- indent ---
set expandtab " use the approproate number of spaces to insert a Tab
set tabstop=2 " number of spaces that a Tab in the file counts for
set shiftwidth=2 " number of spaces to use for each step of (auto)indent
set softtabstop=2 " number of spaces that a Tab counts for while performing editing operations, like inserting a Tab or using BS
set cindent " autoindent
" set autoindent
" set smartindent

set backupskip=/tmp/*,/private/tmp/*

" --- remap of normal mode ---
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap gj j
nnoremap gk k
nnoremap O :<C-u>call append(line('.'), '')<Cr>j

" --- remap of inset mode ---
inoremap jj <ESC>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap “ “”<Left>

" --- for setting pane and tab ---
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

if has('vim_starting') " True while initial source'ing takes place.
 " default on, off when a vimrc or gvimrc file is found
   if &compatible
       set nocompatible
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
NeoBundle 'JuliaLang/julia-vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


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
inoremap <expr> <C-g> neocomplcache#undo_completion()
inoremap <expr> <C-l> neocomplcache#complete_common_string()

" --- NERDTree config ---
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

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
