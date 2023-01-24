-- [[ Git ]]
local g = vim.g
local map = vim.api.nvim_set_keymap
local highlight = vim.api.nvim_set_hl


-- [[ GitGutter ]]
map('n', ']h', [[<Plug>(GitGutterNextHunk)]], { noremap = true })
map('n', '[h', [[<Plug>(GitGutterPrevHunk)]], { noremap = true })
--
map('n', '<Leader>hp', [[<Plug>(GitGutterPreviewHunk)]], { noremap = true })
map('n', '<Leader>hu', [[<Plug>(GitGutterUndoHunk)]], { noremap = true })


-- [[ Conflict Marker ]]

g.conflict_marker_highlight_group = ''
g.conflict_marker_begin           = '^<<<<<<< .*$'
g.conflict_marker_separator       = '^=======$'
g.conflict_marker_end             = '^>>>>>>> .*$'

highlight(0, "ConflictMarkerBegin", { ctermbg = 74, bg = "#2F7366" })
highlight(0, "ConflictMarkerOurs", { ctermbg = 32, bg = "#2e5049" })
highlight(0, "ConflictMarkerTheirs", { ctermbg = 34, bg = "#344f69" })
highlight(0, "ConflictMarkerEnd", { ctermbg = 77, bg = "#2f628e" })
