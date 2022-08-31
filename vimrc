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
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme= "deus" 
" Yank from remote terminal
" UNCOMMENT THIS PART
"Plug 'haya14busa/vim-poweryank'
"map "+y <Plug>(operator-poweryank-osc52)


" Preview ColorScheme
Plug  'mnishz/colorscheme-preview.vim'
" Show colors from html and names when calling ColorHighlight
Plug 'chrisbra/Colorizer'
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
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord ctermbg=238 cterm=bold
augroup END
let g:Illuminate_delay = 1000  "(milliseconds)"
" Rainbow parenthesis for the win
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 
" ALE for formatting and checking syntax
Plug 'w0rp/ale'
"Autocomplete
"Execute CocInstall coc-rust-analyzer 
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
Plug 'mhartington/oceanic-next'
Plug 'ghifarit53/tokyonight-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ackyshake/Spacegray.vim'
Plug 'arcticicestudio/nord-vim'
let g:tokyonight_style = "night" 
let g:tokyonight_enable_italic = 1
let g:spacegray_use_italics = 1
let g:PaperColor_Theme_Options = {
\   'theme': {
\     'default': {
\       'transparent_background': 0,
\       'allow_italic': 0,
\       'allow_bold': 1,
\     }
\   }
\ }


" Initialize plugin system
call plug#end()

" ColorScheme from plug-ins
set termguicolors
set t_Co=256
set t_ut= ""
"colorscheme wombat256grf
"colorscheme peachpuff
"colorscheme nightfly
colorscheme PaperColor
"colorscheme OceanicNext 


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
\	'python': ['trim_whitespace', 'autopep8', 'isort'],
\	'rust': ['trim_whitespace', 'rustfmt'],
\	'yaml': ['trim_whitespace', 'yamlfix'],
\	'json': ['trim_whitespace', 'fixjson'],
\	'cpp': ['trim_whitespace', 'clang-format'],
\	'c': ['trim_whitespace', 'clang-format'],
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
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :  "\<TAB>"







