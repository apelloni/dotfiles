-- [[ Plugins ]]

-- Autoinstall Packer the first time that is run
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- [[ Dev ]]
    use {
        'nvim-telescope/telescope.nvim', -- fuzzy finder
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use 'junegunn/fzf.vim' -- fzf for current file
    use 'majutsushi/tagbar' -- code structure
    use 'Yggdroot/indentLine' -- see indentation
    use 'tpope/vim-fugitive' -- git integration
    use 'junegunn/gv.vim' -- commit history
    use 'RRethy/vim-illuminate' -- Illuminate selected work
    -- use 'windwp/nvim-autopairs' -- auto close brackets, etc.

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use 'simrat39/rust-tools.nvim' -- rust settings

    -- Format
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Filesystem navigation
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons' -- filesystem icons
    }

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    -- Autocomplete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- For luasnip use
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'


    -- git
    use 'airblade/vim-gitgutter'
    use 'rhysd/conflict-marker.vim'

    --  multicursor
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

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

    -- colorscheme
    use 'Mofiqul/dracula.nvim'
    use "EdenEast/nightfox.nvim"
    --   use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })

    use 'Yazeed1s/oh-lucy.nvim'
    use 'rebelot/kanagawa.nvim'
    use({
        'glepnir/zephyr-nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
    })

    -- tabline
    use { 'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

end)
