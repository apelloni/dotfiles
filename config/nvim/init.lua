--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = "\\"
vim.g.localleader = "\\"

-- IMPORTS
require('vars')     -- Variables
require('plug')     -- Plugins Import

require('opts')     -- Options
require('keys')     -- Keymaps
require('autocmd')  -- functions
require('lsp')      -- lsp options
require('complete') -- git utilities
require('git')      -- git utilities
require('tree')     -- explorer


-- START Plugins
require('lualine').setup { -- status line
    --    options = {
    --         theme = 'dracula-nvim'
    --    }
}

--require('nvim-autopairs').setup {} -- match parentesis
require 'telescope'.setup { -- Telescope
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

-- [[ Format ]]
local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.rustfmt,      -- rust
    null_ls.builtins.formatting.autopep8,     -- python
    null_ls.builtins.formatting.isort,        -- python
    null_ls.builtins.formatting.yamlfmt,      -- yaml
    null_ls.builtins.formatting.fixjson,      -- json
    null_ls.builtins.formatting.clang_format, -- c/cpp/cuda
    null_ls.builtins.formatting.shfmt,        -- shell
    null_ls.builtins.formatting.latexindent,  -- latex
    null_ls.builtins.formatting.remark.with({ -- markdown
            filetypes={'markdown','pandoc'}
        }),
    null_ls.builtins.code_actions.gitsigns,
 }

null_ls.setup({ sources = sources })


-- [[ File Explorer ]]
-- For  help on the commands see
-- :h nvim-tree-default-mappings or press `g`
-- EXAMPLES:
-- `<CR>`   edit                open a file or folder;
-- `o`
-- `<C-]>`  cd                  cd in the directory under the cursor
-- `<C-t>`  tabnew              open the file in a new tab
-- `<Tab>`  preview             open the file as a preview
-- `a`      create              add a file; leaving a trailing `/` will add a directory
-- `.`      run_file_command    enter vim command mode with the file the cursor is on
-- `<C-k>`  toggle_file_info    toggle a popup with file infos about the file under the cursor
-- `q`      close               close tree window
require('nvim-tree').setup {
    auto_reload_on_write = true,
    sort_by = "name",
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    tab = {
        sync = {
            open = true,
            close = true,
            ignore = {},
        },
    },
} -- explorer
