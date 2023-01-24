-- [[ Manage Install/Uninstall LSP  ]]
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "clangd",
        "pyright"
    }
}

-- [[ LSP ]]

local capabilities = require('cmp_nvim_lsp').default_capabilities()


require 'lspconfig'.pyright.setup { capabilities = capabilities }
require 'lspconfig'.clangd.setup { capabilities = capabilities }
require 'lspconfig'.sumneko_lua.setup { capabilities = capabilities }
require 'lspconfig'.jedi_language_server.setup { capabilities = capabilities }

require 'lspconfig'.rust_analyzer.setup {
    capabilities = capabilities,
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
    border = _border
}
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
    border = _border
}
)

vim.diagnostic.config {
    float = { border = _border }
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
