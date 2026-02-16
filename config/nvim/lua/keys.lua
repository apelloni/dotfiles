--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local lspconfig = vim.lsp.config

-- [[ nvim- tree ]]
map('n', 't', [[:NvimTreeFocus<CR>]], {}) -- Focus/Open; to close use `q`

-- [[ FZF ]]
map('n', '<C-f>', [[:FzfLua blines <CR>]], { noremap = true, silent = true })


-- [[ Telescope ]]
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})

-- [[ LSP ]]
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '<space>d', vim.lsp.buf.definition, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
    keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
    keymap('n', 'K', vim.lsp.buf.hover, bufopts)
    keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    keymap('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    keymap('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- [[ Format ]]
-- format whole document in NORMAL mode
keymap('n', '<leader>f', function() require("conform").format({ async = true, lsp_fallback = true }) end, bufopts)
-- format selected lines in VISUAL mode
keymap('v', '<leader>f', function() require("conform").format({ async = true, lsp_fallback = true }) end, bufopts)

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
lspconfig['pyright'] = {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig['ts_ls'] = {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig['rust_analyzer'] = {
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
        ["rust-analyzer"] = {}
    }
}

-- Scroll completion menu using TAB
keymap('i', '<Tab>',
    function()
        return (
            (vim.fn.pumvisible() == 1 and '<C-N>')
            or '<Tab>'
        )
    end,
    { noremap = true, silent = true, expr = true }
)


-- Use Shift-Tab to scroll up in the completion menu
keymap('i', '<S-Tab>',
    function()
        return (
            (vim.fn.pumvisible() == 1 and '<C-P>')
            or '<S-Tab>'
        )
    end,
    { noremap = true, silent = true, expr = true }
)

--CheckBackspace = function()
--    local col = vim.fn.col('.') - 1
--    local last_char = string.sub(vim.fn.getline('.'),col,col)
--
--    return not col or string.match(last_char,'%s') == ' '
--    --return true
--end
--keymap('i', '<Tab>',
--    function()
--        return (
--            (vim.fn.pumvisible() == 1 and '<C-N>')
--            or (CheckBackspace() and '<TAB>')
--            or '<C-X><C-O>'
--        )
--    end,
--    {noremap=true, silent=true, expr = true}
--    )
--
--keymap('i', '<S-Tab>',
--    function()
--        return (
--            (vim.fn.pumvisible() == 1 and '<C-P>')
--            or '<S-Tab>'
--        )
--    end,
--    {noremap=true, silent=true, expr = true}
--    )
--
