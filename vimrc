set number
silent! colorscheme koehler

" Load all the plugins using  junegunn/vim-plug as manager

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Reopen from last edited line
Plug 'farmergreg/vim-lastplace'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Lightline
Plug 'https://github.com/itchyny/lightline.vim'
" Preview ColorScheme
Plug  'mnishz/colorscheme-preview.vim'
" Nerd Tree
Plug 'preservim/nerdtree'
" show git changes
Plug 'airblade/vim-gitgutter'
" multi cursor with <C-n>
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'

" ALE for formatting and checking syntax
Plug 'w0rp/ale'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kyoz/purify', { 'rtp': 'vim/' }

" Initialize plugin system
call plug#end()

" With the ale plugin to highlight syntax problems
let g:ale_linters = {
\	'python': ['mypy', 'pylint'],
\	'rust': ['cargo', 'rls', 'analyzer']
\}
" With the ale plugin to format document
let g:ale_fixers = {
\	'python': ['autopep8', 'isort'],
\	'rust': ['rustfmt']
\}
