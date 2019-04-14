set encoding=utf-8
set fileformat=unix
set number
set showcmd

" use TrueColor and set color scheme
set termguicolors
colorscheme monokai

" share clipbord
set clipboard=unnamed

" for vue
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html

" for dynamic provider
let g:python_host_prog = expand('$HOME/.pyenv/versions/2.7.16/bin/python2')
let g:python3_host_prog = expand('$HOME/.pyenv/versions/anaconda3-5.3.1/bin/python')
let g:ruby_host_prog = expand('$HOME/.rbenv/versions/2.6.2/bin/neovim-ruby-host')
let g:node_host_prog = expand('$HOME/.config/yarn/global/node_modules/.bin/neovim-node-host')

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

" --- remapping command for normal mode ---
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap gj j
nnoremap gk k
nnoremap O :<C-u>call append(line('.'), '')<Cr>j

" move pane
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h

nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

""" dein configurations
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml_dir = expand('~/.config/dein')

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
