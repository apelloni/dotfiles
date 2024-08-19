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
opt.cursorline = true            -- bool: Highlight current line

-- [[ signs ]]
opt.signcolumn = 'auto:5'        -- str:  auto:[0-9] to disply multiple signs

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- [[ Clipboard ]]
-- opt.clipboard = 'unnamedplus'

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
require('nightfox')
cmd('colorscheme dracula')
cmd('colorscheme kanagawa')
cmd('colorscheme nightfox')
cmd('colorscheme zephyr')
--require('nightfox')
-- require('kanagawa')
highlight(0, "Beacon", { bg = "white" })


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

map('n', '<space><space>', 'za', { noremap = true })
