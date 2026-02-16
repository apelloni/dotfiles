local lspconfig = vim.lsp.config
--
-- [[ Manage Install/Uninstall LSP  ]]
require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
        "pyright",
        "jedi_language_server",
        "texlab"
    }
}

-- [[ LSP ]]

local capabilities = require('cmp_nvim_lsp').default_capabilities()


lspconfig['pyright'] = { capabilities = capabilities }
lspconfig['clangd'] = { capabilities = capabilities }
lspconfig['jedi_language_server'] = { capabilities = capabilities }
lspconfig['remark_ls'] = { settings = { remark = {} } }
lspconfig['texlab'] = { capabilities = capabilities }
lspconfig['lua_ls'] = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
lspconfig.rust_analyzer = {
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
                checkOnSave = true,
            },
        },
    },
}

lspconfig['rust-tools'] = opts
--require'rust-tools'.inlay_hints.enable()
