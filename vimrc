set number

syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

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

" File manger 
" The first time it needs 
"  :CocInstall coc-explorer
Plug 'weirongxu/coc-explorer'
nnoremap <space>e :CocCommand explorer<CR>

" devicons 
Plug 'ryanoasis/vim-devicons'

" Mathematica syntax 
Plug 'voldikss/vim-mma'

" Reopen from last edited line
Plug 'farmergreg/vim-lastplace'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Airline with powerline font
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
" Preview ColorScheme
Plug  'mnishz/colorscheme-preview.vim'
" Nerd Tree
"Plug 'preservim/nerdtree'
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
"Allow transparency on all themes
"Plug 'Kjwon15/vim-transparent'

" File Header
Plug 'alpertuna/vim-header'
let g:header_auto_add_header = 0
let g:header_field_author = 'Andrea Pelloni'
let g:header_field_author_email = 'apelloni'
map <F4> :AddHeader<CR>

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'gryf/wombat256grf'
Plug 'bluz71/vim-nightfly-guicolors'	
Plug 'artanikin/vim-synthwave84'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" ColorScheme from plug-ins
set termguicolors
set t_Co=256
set t_ut= ""
"colorscheme wombat256grf
colorscheme nightfly


" With the ale plugin to highlight  syntax problems
let g:ale_linters = {
\	'python': ['mypy', 'pylint'],
\	'rust': ['cargo', 'rls',  'analyzer'],
\	'yaml': ['yamllint'],  
\	'cpp': ['clang-tidy'], 
\	'c': ['clang-tidy'],
\	'sh': ['shellcheck'],
\}
" With the ale plugin to format document
let g:ale_fixers = {
\	'python': ['autopep8', 'isort'],
\	'rust': ['rustfmt'],
\	'yaml': ['yamlfix'],
\	'json': ['fixjson'],
\	'cpp': ['clang-format'],
\	'c': ['clang-format'],
\	'sh': ['shfmt'],
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

"explorer.icon.enableVimDevicons": true
"explorer.icon.enableNerdfont": true

