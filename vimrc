call pathogen#infect()

set ignorecase incsearch smartindent autoindent number
set colorcolumn=80 showbreak=↪ display=lastline rtp+=~/.fzf

"exit vim quickly
map <leader>q ZQ
map <leader>w ZZ

"use j and k for visual lines
"not just actual lines
noremap j gj
noremap k gk

"hide line numbers and showbreak to more easily copy text directly from terminal
nmap <leader>h :set nonumber showbreak=<cr>

"toggle display of invisible characters
nmap <leader>l :set list!<cr>

"send entire file to repl using vim-slime
map <leader>s :%SlimeSend<cr>

"save and refresh web browser
map <leader>r :w<bar>:!xdotool search --name 'Pentadactyl' key F5<cr><cr>

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
  autocmd FileType ruby,cucumber,vim,eruby,go setlocal ts=2 sts=2 sw=2 et
  autocmd FileType javascript,css,sh,c setlocal ts=4 sts=4 sw=4 et
  autocmd FileType python,html,php,java setlocal ts=4 sts=4 sw=4 et
  autocmd FileType html,php setlocal showbreak=↪................................
  autocmd FileType text setlocal modeline
  autocmd FileType gitcommit setlocal spell
  autocmd BufRead,BufNewFile *.cap set filetype=ruby
endif

" use vim-slime with tmux
let g:slime_target = "tmux"

set t_Co=256

colorscheme jellybeans
" colorscheme molokai
