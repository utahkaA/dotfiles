" syntax highlight
syntax enable
set background=dark
colorscheme monokai

" indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

set number

" md as markdown, instead of modula2
" autocmd MyAutoGroup BufNewFile,BufRead *.{md,mdwn,mkdn,mark*} set filetype=markdown

" Disable highlight italic in Markdown
" autocmd MyAutoGroup FileType markdown hi! def link markdownItalic LineNr
