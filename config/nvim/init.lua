--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = "\\"
vim.g.localleader = "\\"

-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugins Import
require('func') -- functions
require('lsp') -- lsp options
require('complete') -- git utilities
require('git') -- git utilities
require('tree') -- explorer


-- START Plugins
require('lualine').setup { -- status line
    options = {
        theme = 'dracula-nvim'
    }
}
require('nvim-autopairs').setup {} -- match parentesis

-- FORMAT
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.rustfmt, -- rust
    null_ls.builtins.formatting.autopep8, -- python
    null_ls.builtins.formatting.isort, -- python
    null_ls.builtins.formatting.yamlfmt, -- yaml
    null_ls.builtins.formatting.fixjson, -- json
    null_ls.builtins.formatting.clang_format, -- c/cpp/cuda
    null_ls.builtins.formatting.shfmt, -- shell
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ sources = sources })
