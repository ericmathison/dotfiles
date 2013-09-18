call pathogen#infect()

set ignorecase
set incsearch
set smartindent
set autoindent
set showbreak=↪
set display=lastline
set colorcolumn=80

"in addition to yanking text to the ordinary "unnamed" buffer, also place yanked
"text in the system clipboard
set clipboard=unnamedplus

"exit vim quickly
map <leader>q ZQ
map <leader>w ZZ

"use j and k for visual lines
"not just actual lines
noremap j gj
noremap k gk

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

"start with relative line numbering
call NumberToggle()

"toggle relative line numbers
nnoremap <leader>n :call NumberToggle()<cr>

"hide line numbers and showbreak
nmap <leader>b :set norelativenumber nonumber showbreak=<cr>

"toggle display of invisible characters
nmap <leader>l :set list!<cr>

"send entire file to repl using vim-slime
map <leader>s :%SlimeSend<cr>

"scroll page using arrows
nmap <Up> <C-y>
nmap <Down> <C-e>
nmap <Left> 5zh
nmap <Right> 5zl
vmap <Up> <C-y>
vmap <Down> <C-e>
vmap <Left> 5zh
vmap <Right> 5zl

if has("autocmd")
  filetype plugin indent on
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType css setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  " autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab showbreak=↪.........................................
  autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab
  " autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab showbreak=↪.........................................
  autocmd FileType text setlocal modeline
  autocmd BufNewFile,BufRead *.snip setf html
  autocmd BufNewFile,BufRead *.glob setf html
endif

" use vim-slime with tmux
let g:slime_target = "tmux"

set t_Co=256

colorscheme jellybeans
" colorscheme molokai
