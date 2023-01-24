-- [[ Plugins ]]

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- [[ Dev ]]
    use {
        'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'junegunn/fzf.vim' -- fzf for current file
    use 'majutsushi/tagbar' -- code structure
    use 'Yggdroot/indentLine' -- see indentation
    use 'tpope/vim-fugitive' -- git integration
    use 'junegunn/gv.vim' -- commit history
    use 'windwp/nvim-autopairs' -- auto close brackets, etc.

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'simrat39/rust-tools.nvim' -- rust settings

    use 'jose-elias-alvarez/null-ls.nvim'

    -- filesystem navigation
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- filesystem icons
    }

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    -- autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- git
    use 'airblade/vim-gitgutter'
    use 'rhysd/conflict-marker.vim'

    --  multicursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    --   -- Load on an autocommand event
    --   use {'andymass/vim-matchup', event = 'VimEnter'}

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- [[ Theme ]]
    use 'mhinz/vim-startify' -- start screen
    use 'DanilaMihailov/beacon.nvim' -- cursor jump
    use {
        'nvim-lualine/lualine.nvim', -- statusline
        requires = { 'kyazdani42/nvim-web-devicons',
            opt = true }
    }
    use 'Mofiqul/dracula.nvim' -- colorscheme
end)
