set number

syntax on
"set termguicolors
silent! colorscheme koehler

hi CursorLine cterm=underline,bold
"hi CursorLine cterm=NONE ctermbg=darkgray
nnoremap H :set cursorline!<CR>


" Load all the plugins using  junegunn/vim-plug as manager

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" improved highlight python syntax 
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1

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
Plug 'rhysd/conflict-marker.vim'
" multi cursor with <C-n>
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
" Illuminate selected work
Plug 'RRethy/vim-illuminate'
" Rainbow parenthesis for the win
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 
" ALE for formatting and checking syntax
Plug 'w0rp/ale'
"Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

" Vim conflic marker
let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_separator = '^=======$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin ctermbg=74
highlight ConflictMarkerOurs ctermbg=32
highlight ConflictMarkerTheirs ctermbg=34
highlight ConflictMarkerEnd ctermbg=77

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :  "\<TAB>" 
