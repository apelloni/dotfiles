--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command
local map = vim.api.nvim_set_keymap
local fn = vim.fn
local v = vim.v
local g = vim.g
local highlight = vim.api.nvim_set_hl


-- [[ Context ]]
opt.colorcolumn = '80'           -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "yes"           -- str:  Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
cmd('colorscheme dracula')

-- [[ Search ]]
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one


-- [[ Folding ]]


CustomFold = function()
    -- function! CustomFold()
    local fold_size = v.foldend - v.foldstart + 1
    local file_size = fn.line("$")
    local foldPercentage = string.format("[%4.1f",
        (fold_size * 1.0) / file_size * 100) .. "%] "
    --
    local prefix = string.format('   %-5d', fold_size)
    local separator = ' ::  '
    --
    return prefix .. foldPercentage .. separator .. fn.getline(v.foldstart)
end


map('n', '<space><space>', 'za', { noremap = true })


-- fold options
opt.foldmethod = "indent"
opt.foldlevelstart = 99
opt.foldenable = false
opt.fillchars = "fold: "
highlight(0, "Folded", {
    ctermbg = "Black", ctermfg = "White",
    bg = "Gray30", fg = "White",
    bold = true
})
opt.foldtext = 'v:lua.CustomFold()'


local autocmd = vim.api.nvim_create_autocmd
--
-- " Maple folding between #:[--- and #:---]
autocmd("FileType", { pattern = "maple", command = "setlocal foldmethod=marker" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldmarker=:[---,:---]" })
autocmd("FileType", { pattern = "maple", command = "setlocal commentstring=#%s" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldignore=#" })
autocmd("FileType", { pattern = "maple", command = "setlocal nofoldenable" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldlevelstart=99" })
--
-- FORM folding between *--%[ and *--#]
autocmd("FileType", { pattern = "form", command = "setlocal foldmethod=marker" })
autocmd("FileType", { pattern = "form", command = "setlocal foldmarker=--#[,--#]" })
autocmd("FileType", { pattern = "form", command = "setlocal commentstring=*%s" })
autocmd("FileType", { pattern = "form", command = "setlocal foldignore=*" })
autocmd("FileType", { pattern = "form", command = "setlocal nofoldenable" })
autocmd("FileType", { pattern = "form", command = "setlocal foldlevelstart=99" })
