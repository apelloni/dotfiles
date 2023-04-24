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
    -- [[ Dev ]]
    {'nvim-telescope/telescope.nvim', -- fuzzy finder
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- fzf for current file
    { 'ibhagwan/fzf-lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    { 'junegunn/fzf.vim',
        build = './install --bin'
    },

    'majutsushi/tagbar',               -- code structure
    'Yggdroot/indentLine',             -- see indentation
    'junegunn/gv.vim',                 -- commit history
    'RRethy/vim-illuminate',           -- Illuminate selected work
    'jose-elias-alvarez/null-ls.nvim', -- Format
    'rstacruz/vim-closer',             -- match brackets on Enter
    'godlygeek/tabular',               -- tabularize
    -- use 'windwp/nvim-autopairs' -- auto close brackets, etc.


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
    -- use 'airblade/vim-gitgutter'    -- show changes


    -- Dim all but the current paragraph using Limelight
    'junegunn/limelight.vim',

    -- markdown pretty syntax
    'vim-pandoc/vim-pandoc-syntax',
    { 'vim-pandoc/vim-pandoc',
        dependencies= {
            'vim-pandoc/vim-pandoc-syntax',
            'plasticboy/vim-markdown',
            lazy = true
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
    'mhinz/vim-startify', -- start screen
    'DanilaMihailov/beacon.nvim', -- cursor jump
    {
        'nvim-lualine/lualine.nvim', -- statusline
        dependencies = { 'kyazdani42/nvim-web-devicons',
            lazy = true }
    },

    -- colorscheme
    'Mofiqul/dracula.nvim',
    "EdenEast/nightfox.nvim",
    --   use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    'Yazeed1s/oh-lucy.nvim',
    'rebelot/kanagawa.nvim',
    {
        'glepnir/zephyr-nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },

    -- tabline
    { 'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
})
