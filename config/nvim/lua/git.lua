-- [[ Git ]]
local g = vim.g
local map = vim.api.nvim_set_keymap
local highlight = vim.api.nvim_set_hl


-- [[ GitSign ]]
require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']h', function()
            print("WHAT")
            if vim.wo.diff then return ']h' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[h', function()
            if vim.wo.diff then return '[h' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        -- map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        -- map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        -- map('n', '<leader>hS', gs.stage_buffer)
        -- map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hu', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        -- map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

-- [[ GitGutter ]]
-- map('n', ']h', [[<Plug>(GitGutterNextHunk)]], { noremap = true })
-- map('n', '[h', [[<Plug>(GitGutterPrevHunk)]], { noremap = true })
-- --
-- map('n', '<Leader>hp', [[<Plug>(GitGutterPreviewHunk)]], { noremap = true })
-- map('n', '<Leader>hu', [[<Plug>(GitGutterUndoHunk)]], { noremap = true })
--
-- g.gitgutter_sign_added                   = '▋'--'┃'  -- default: '+'
-- g.gitgutter_sign_modified                = '▋'--'┃'  -- default: '~'
-- g.gitgutter_sign_removed                 = '_'
-- g.gitgutter_sign_removed_first_line      = '‾'
-- g.gitgutter_sign_removed_above_and_below = '_¯'
-- g.gitgutter_sign_modified_removed        = '~_'

-- [[ Conflict Marker ]]

g.conflict_marker_highlight_group = ''
g.conflict_marker_begin           = '^<<<<<<< .*$'
g.conflict_marker_separator       = '^=======$'
g.conflict_marker_end             = '^>>>>>>> .*$'

highlight(0, "ConflictMarkerBegin", { ctermbg = 74, bg = "#2F7366" })
highlight(0, "ConflictMarkerOurs", { ctermbg = 32, bg = "#2e5049" })
highlight(0, "ConflictMarkerTheirs", { ctermbg = 34, bg = "#344f69" })
highlight(0, "ConflictMarkerEnd", { ctermbg = 77, bg = "#2f628e" })
