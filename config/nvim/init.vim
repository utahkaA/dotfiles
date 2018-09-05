set encoding=utf-8
set fileformat=unix
set number
set showcmd

" use TrueColor
set termguicolors
colorscheme monokai

" --- dont make backup files ---
set nowritebackup
set nobackup
set noswapfile
set backupskip=/tmp/*,/private/tmp/*

set expandtab
set softtabstop=2
" set tabstop=2
set shiftwidth=2

" remapping command for insert mode
inoremap jj <ESC>

" move pane
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

""" dein configurations
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/nvim')

  call dein#load_toml(s:toml_dir . '/dein.toml', { 'lazy': 0 })
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', { 'lazy': 1 })

  call dein#end()
  call dein#save_state()
endif

" to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

nnoremap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
