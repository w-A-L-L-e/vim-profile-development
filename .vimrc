execute pathogen#infect()

syntax on
filetype plugin indent on

set background=dark
colorscheme railscasts

syntax on

set encoding=utf-8

" fixes copy paste clipboard so it works with default clip
set clipboard=unnamed

set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set expandtab
" set mouse=a
" set nu

" not working yet 
" let mapleader=","

command FormatJson execute "%!jq '.'"

:map <C-a> GVgg
:map <C-n> :enew
:map <C-o> :e . <Enter>

" map save with ctrl-d both in regular and insert modes!!!
:map <C-d> <Esc> :w <CR>
:imap <C-d> <Esc> :w <CR>

" ctrl-c to quit
:map <C-c> <Esc> :q <CR>
:imap <C-c> <Esc> :q <CR>

:map <C-t> :tabnew <Enter>
:map <C-i> >>
:map <C-w> :close <Enter>
:map <C-W> :q! <Enter>
:map <F3> n

:map <C-b> :NERDTreeToggle<CR>

:map <C-l> :wincmd p<CR>
:imap <C-l> :wincmd p<CR>

au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
" :map @@x !%xmllint --format --recover -^M

let g:yapf_style = "pep8"

" vmap <C-S> :call I18nTranslateString()<CR>
" vmap <C-Y> :call I18nDisplayTranslation()<CR>

" autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" use following to auto startup NERDTree and switch to right split
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" better way is to add following alias to .bashrc
" alias mate='vim -c NERDTree'

