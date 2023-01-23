--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = "\\"
vim.g.localleader = "\\"

-- IMPORTS
require('vars')      -- Variables
require('opts')      -- Options
require('keys')      -- Keymaps
require('plug')      -- Plugins
require('func')      -- functions
require('lsp')      -- lsp options



-- PLUGINS: Add this section

require('nvim-tree').setup{}

-- status line
require('lualine').setup {
  options = {
    theme = 'dracula-nvim'
  }
 }

-- match parentesis
require('nvim-autopairs').setup{}



-- Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
    enable = true,
    -- disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.rustfmt,        -- rust
    null_ls.builtins.formatting.autopep8,       -- python
    null_ls.builtins.formatting.isort,          -- python
    null_ls.builtins.formatting.yamlfix,        -- yaml
    null_ls.builtins.formatting.fixjson,        -- json
    null_ls.builtins.formatting.clang_format,   -- c/cpp/cuda
    null_ls.builtins.formatting.shfmt,          -- shell
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ sources = sources })

-- require("null-ls").register({
--     name = "my_sources",
--     filetypes = { "rust" },
--     sources = { 'rustfmt' },
-- })
