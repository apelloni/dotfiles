-- [[ Plugins ]]

-- Autoinstall lazy the first time that is run
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Import Plugins
require("lazy").setup({
    -- [[LUA]]
    {
        "vhyrro/luarocks.nvim",
        priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    },
    -- [[ Dev ]]
    {
        'nvim-telescope/telescope.nvim', -- fuzzy finder
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- enable sudo with SudaWrite
    'lambdalisue/vim-suda',

    -- fzf for current file
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'junegunn/fzf.vim',
        build = './install --bin'
    },

    'majutsushi/tagbar',     -- code structure
    'Yggdroot/indentLine',   -- see indentation
    'junegunn/gv.vim',       -- commit history
    'RRethy/vim-illuminate', -- Illuminate selected work
    -- 'nvimtools/none-ls.nvim', -- Format
    'rstacruz/vim-closer',   -- match brackets on Enter
    'godlygeek/tabular',     -- tabularize
    -- use 'windwp/nvim-autopairs' -- auto close brackets, etc.

    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" }, -- or "autopep8", "isort"
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                markdown = { "prettier" },
                sh = { "shfmt" },
            },
        },
    },

    -- COPILOT
    {
        "zbirenbaum/copilot-cmp",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "zbirenbaum/copilot.lua",
        },
        config = function()
            require("copilot_cmp").setup()
        end
    },

    -- multicursor
    { 'mg979/vim-visual-multi', branch = 'master' },

    -- LSP
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    'simrat39/rust-tools.nvim', -- rust settings


    -- Filesystem navigation
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons' -- filesystem icons
    },

    -- Autocomplete
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    "onsails/lspkind.nvim",

    -- For luasnip use
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- git
    'tpope/vim-fugitive',        -- git integration
    'rhysd/conflict-marker.vim', -- merge conflicts
    {                            -- show changes
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        --    config = function()
        --        require('gitsigns').setup()
        --    end
    },
    "f-person/git-blame.nvim",
    -- use 'airblade/vim-gitgutter'    -- show changes

    -- show sign in folds
    {
        'lewis6991/foldsigns.nvim',
        config = function()
            require('foldsigns').setup()
        end
    },

    -- Dim all but the current paragraph using Limelight
    'junegunn/limelight.vim',

    -- Zen Mode
    {
        "folke/zen-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- highlight TODO, WARN ...
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

    -- quarto
    {
        'quarto-dev/quarto-nvim',
        'jmbuhr/otter.nvim',
        'benlubas/molten-nvim', -- jupyther support
    },

    -- Addistional syntaxes
    { 'hura/vim-asymptote' },

    -- markdown pretty syntax
    -- 'vim-pandoc/vim-pandoc-syntax',
    -- { 'vim-pandoc/vim-pandoc',
    --     dependencies= {
    --         'vim-pandoc/vim-pandoc-syntax',
    --         'plasticboy/vim-markdown',
    --         lazy = true
    --     }
    -- },
    {
        "OXY2DEV/markview.nvim",
        lazy = false, -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        }
    },

    -- markdown preview
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Show Pictures
    { 'edluffy/hologram.nvim' },

    --   -- Load on an autocommand event
    --   use {'andymass/vim-matchup', event = 'VimEnter'}

    -- Post-install/update hook with neovim command
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },


    -- [[ Theme ]]
    'mhinz/vim-startify',            -- start screen
    'DanilaMihailov/beacon.nvim',    -- cursor jump
    {
        'nvim-lualine/lualine.nvim', -- statusline
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            lazy = true
        }
    },

    -- colorscheme
    'Mofiqul/dracula.nvim',
    "EdenEast/nightfox.nvim",
    "olimorris/onedarkpro.nvim",
    "diegoulloao/neofusion.nvim",
    "fynnfluegge/monet.nvim",
    {
        "navarasu/onedark.nvim",
        config = function()
            require('onedark').setup({
                style = "deep",
            })
        end
    },
    {
        "neanias/everforest-nvim",
        config = function()
            require('everforest').setup({
                background = "hard",
                transparent_background_level = 0,
            })
        end
    },

    --   use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    'Yazeed1s/oh-lucy.nvim',
    'rebelot/kanagawa.nvim',
    {
        'glepnir/zephyr-nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },

    -- tabline
    {
        'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
})
