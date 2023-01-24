-- [[ Auto Complete ]]
local opt = vim.opt
local cmp = require 'cmp'
local api = vim.api
local fn = vim.fn

-- General settings
opt.completeopt = "menu,menuone,noselect"

-- Utility Functions
local has_words_before = function() -- Check if char before is not a whitespace
    unpack = unpack or table.unpack
    local line, col = unpack(api.nvim_win_get_cursor(0))
    return col ~= 0 and api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    api.nvim_feedkeys(api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Configurations
cmp.setup({
    completion = {
        autocomplete = false
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        --completion = {border = "rounded",  winhighlight = "Normal:None"},
        completion = { border = "rounded" },
        documentation = { border = "rounded" },
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-space>'] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                -- The fallback function sends a already mapped key.
                -- In this case, it's probably `<Tab>`.
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                feedkey("<C-h>", "")
            end
        end, { "i", "s" })
        ,
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        { name = 'path' },
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
