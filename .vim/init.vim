execute pathogen#infect()

" enter current millenium
set nocompatible


" search into subfolders and have tab completion use with :find <tab>
set path+=**
set wildmenu

" make copy paste work with other apps
set clipboard=unnamed

" Initialize plugin system
" call plug#begin('~/.vim/plugged')

"setup vim-plug {{{

  "Note: install vim-plug if not present
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif

  "Note: Skip initialization for vim-tiny or vim-small.
  if !1 | finish | endif
  if has('vim_starting')
    set nocompatible               " Be iMproved
    " Required:
    " call plug#begin()
    call plug#begin('~/.vim/plugged')
  endif

"}}}



Plug 'majutsushi/tagbar'                  " show tags in a bar (functions etc) for easy browsing
" Plug 'vim-airline/vim-airline'          " make statusline awesome
" Plug 'vim-airline/vim-airline-themes'   " themes for statusline
Plug 'danilo-augusto/vim-afterglow'       " afterglow theme 

"Plug 'kien/ctrlp.vim'  " fuzzy search files
"Plug 'tweekmonster/impsort.vim'  " color and sort imports
"Plug 'wsdjeg/FlyGrep.vim'        " awesome grep on the fly
Plug 'airblade/vim-gitgutter'     " show git changes to files in gutter

Plug 'tpope/vim-repeat'         " repeat (dot) operator on more things
Plug 'tpope/vim-speeddating'    " operate on dates 
Plug 'tpope/vim-surround'       " have cs command for changing surrounding quotes etc.
Plug 'tpope/vim-commentary'     " comment-out by gc
" Plug 'tpope/vim-unimpaired'   " operate more on brackets
Plug 'djoshea/vim-autoread'     " auto reload changed files on disk

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' } "to highlight files in nerdtree

Plug 'tpope/vim-fugitive' " git in vim

Plug 'vim-crystal/vim-crystal'
Plug 'elorest/vim-slang'

" fast but short autocomplete
" Plug 'davidhalter/jedi-vim'             " jedi for python
" Plug 'Vimjas/vim-python-pep8-indent'    " better indenting for python
" Plug 'w0rp/ale'                         " python linters
" Plug 'ncm2/ncm2'                        " awesome autocomplete plugin
" Plug 'roxma/nvim-yarp'                  " dependency of ncm2
" Plug 'HansPinckaers/ncm2-jedi'          " fast python completion (use ncm2 if you want type info or snippet support)
" Plug 'ncm2/ncm2-bufword'                " buffer keyword completion
" Plug 'ncm2/ncm2-path'                   " filepath completion

" Better Visual Guide
" Plug 'Yggdroot/indentLine'

" syntax check
Plug 'w0rp/ale'
" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
" Formatter
Plug 'Chiel92/vim-autoformat'

Plug 'SirVer/ultisnips' " auto completion snippets
Plug 'honza/vim-snippets'

call plug#end()

" also run :checkhealth to see if these paths and pynvim package is installed
" with pip install pynvim
" or pip install neovim (might also work)

" let g:python3_host_prog = '/Users/wschrep/pythonWork/python_env/bin/python3'
" let g:python_host_prog = '/Users/wschrep/pythonWork/python_env/bin/python'

let g:python3_host_prog = '/Users/wschrep/.pyenv/shims/python'
let g:python_host_prog = '/usr/bin/python2'



syntax on
filetype plugin indent on

set background=dark
let g:afterglow_blackout=1
colorscheme afterglow

syntax on
set encoding=utf-8
set shortmess+=c " autocomplete fix

set mouse=a  " change cursor per mode
set wrapscan  " begin search from top of file when nothing is found anymore

set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning

set smarttab
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

" disable anoying highlight
set nohlsearch


" set copy lines to more than 50
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications

" https://medium.com/@hanspinckaers/setting-up-vim-as-an-ide-for-python-773722142d1d
" ncm2 settings
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=menuone,noselect,noinsert
" make it FAST
"let ncm2#popup_delay = 5
"let ncm2#complete_length = [[1,1]]
"let g:ncm2#matcher = 'substrfuzzy'

set pumheight=5

"set number norelativenumber
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" disable stuff when autocomplete window is open
function! DisableExtras()
  call nvim_win_set_option(g:float_preview#win, 'number', v:false)
  call nvim_win_set_option(g:float_preview#win, 'relativenumber', v:false)
  call nvim_win_set_option(g:float_preview#win, 'cursorline', v:false)
endfunction

autocmd User FloatPreviewWinOpen call DisableExtras()


" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


command FormatJson execute "%!jq '.'"

" my keyboard mappings to make saving + quitting faster
" ctrl-b for nerdtree toggle
" ctrl-d save 
" ctrl-w quit and dont save
" ctrl-l switch between tree and edit page
" ctrl-o open file
map <C-a> GVgg
map <C-n> :enew
map <C-o> :e . <Enter>

" map save with ctrl-d both in regular and insert modes!!!
map <C-d> <Esc> :w <CR>
imap <C-d> <Esc> :w <CR>

" ctrl-c to quit
map <C-c> <Esc> :q <CR>
imap <C-c> <Esc> :q <CR>

map <C-t> :tabnew <Enter>
map <C-i> >>
map <C-w> :close <Enter>
map <C-W> :q! <Enter>
map <F3> n

map <C-b> :NERDTreeToggle<CR>
map <C-p> :PythonIdeToggle<CR>

map <C-l> :wincmd p<CR>
imap <C-l> :wincmd p<CR>

" fail below does not work yet. we want tab switching possible with alt+cmd+left/right arrow
" map <Esc>[f :tabn
" map <Esc>[b :tabp

" Translation plugin
vmap <C-S> :call I18nTranslateString()<CR>
" vmap <C-Y> :call I18nDisplayTranslation()<CR>


au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
" :map @@x !%xmllint --format --recover -^M

let g:yapf_style = "pep8"

" powerline needs seperate font, skipping now
"let g:airline_powerline_fonts = 1
"let g:airline_section_y = ""
"let g:airline#extensions#tabline#enabled = 1
" Airline settings
" do not show error/warning section
" let g:airline_section_error = ""
" let g:airline_section_warning = ""
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
" endif

" NCM2 " added for latest/slower version of complete
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  "inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END


" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}



" patch to keep nvim dark in terminal
au ColorScheme * hi Normal ctermbg=None

