-- [[ Manage Install/Uninstall LSP  ]]
require("mason").setup{}
require("mason-lspconfig").setup{
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer" ,
        "clangd",
        "pyright"}
        }

-- [[ LSP ]]

local capabilities = require('cmp_nvim_lsp').default_capabilities()


require'lspconfig'.pyright.setup{capabilities=capabilities}
require'lspconfig'.clangd.setup{capabilities=capabilities}
require'lspconfig'.sumneko_lua.setup{capabilities=capabilities}
require'lspconfig'.jedi_language_server.setup{capabilities=capabilities}

require'lspconfig'.rust_analyzer.setup{
    capabilities=capabilities,
--    settings = {
--        ["rust-analyzer"] = {
--            inlayHints = {
--                bindingModeHints = { enable=true},
--                closureReturnTypeHints = {enable="always"},
--                discriminantHints = {enable="always"},
--                expressionAdjustmentHints = {enable="always"},
--            },
--        },
--    },
}

-- [[ LSP options ]]

-- Set border of the LSP
-- border options in :h nvim_open_win()
local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border= _border
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = _border
  }
)

vim.diagnostic.config{
  float={border=_border}
}

require('lspconfig.ui.windows').default_options = {
  border = _border
}


-- RUST
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)
--require'rust-tools'.inlay_hints.enable()

-- [[ Auto Complete ]]

-- General settings
vim.o.completeopt=menu,menuone,noselect

-- Configurations
local cmp = require'cmp'

cmp.setup({
 snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      --completion = {border = "rounded",  winhighlight = "Normal:None"},
      completion = {border = "rounded"},
      documentation= {border = "rounded"},
    },

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<TAB>'] = cmp.mapping.select_next_item(),
      ['<S-TAB>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path'},
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- -- Set configuration for specific filetype.
  -- cmp.setup.filetype('gitcommit', {
  --   sources = cmp.config.sources({
  --     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  --   }, {
  --     { name = 'buffer' },
  --   })
  -- })

  -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline({ '/', '?' }, {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = {
  --     { name = 'buffer' }
  --   }
  -- })

  -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  -- cmp.setup.cmdline(':', {
  --   mapping = cmp.mapping.preset.cmdline(),
  --   sources = cmp.config.sources({
  --     { name = 'path' }
  --   }, {
  --     { name = 'cmdline' }
  --   })
  -- })

  -- Set up lspconfig.
  --local capabilities = require('cmp_nvim_lsp').default_capabilities()
  ---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
