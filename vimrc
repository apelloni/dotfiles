set number

" Load all the plugins using  junegunn/vim-plug as manager

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Lightline 
Plug 'https://github.com/itchyny/lightline.vim'
" Nerd Tree
Plug 'preservim/nerdtree'
" show git changes
Plug 'airblade/vim-gitgutter'
" multi cursor with <C-n>
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'

Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" With the ale plugin to work with rust
"let g:ale_linters = {'rust': ['cargo', 'rls', 'analyzer']} 
let g:ale_linters = {'python': ['mypy', 'pylint']} 
