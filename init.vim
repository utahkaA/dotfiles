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

let s:cache_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.cache') : $XDG_CONFIG_HOME
let s:dein_base = s:cache_home . '/dein'
let s:dein_repo = s:dein_base . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo))
endif
execute 'set runtimepath^=' . s:dein_repo

if dein#load_state(s:dein_base)
  call dein#begin(s:dein_base)
  let s:toml = '~/.config/dein/plugins.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Required:
filetype plugin indent on
