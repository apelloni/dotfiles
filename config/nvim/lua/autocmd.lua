-- [[ Functions ]]

local autocmd = vim.api.nvim_create_autocmd

-- [[ Formatting ]]
--
-- Trim trailing white spaces
autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
--
-- Trim trailing lines
autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[silent! %s#\($\n\s*\)\+\%$##]]
})
--
-- Remember last position
autocmd({ "BufReadPost" }, {
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})


-- [[ Execute Programs ]]
--
-- nnoremap <Leader>r :w <CR>:!%:p <CR>
autocmd("FileType", {
    pattern = "maple",
    command = "nnoremap <Leader>r :w <CR>:!maple %:p <CR>"
})
autocmd("FileType", {
    pattern = "form",
    command = "nnoremap <Leader>r :w <CR>:!form %:p <CR>"
})
autocmd("FileType", {
    pattern = "python",
    command = "nnoremap <Leader>r :w <CR>:!python %:p <CR>"
})
autocmd("FileType", {
    pattern = "rust",
    command = "nnoremap <Leader>r :!cargo run<CR>"
})
autocmd("FileType", {
    pattern = "markdown",
    command = "nnoremap <Leader>r :w <CR>:!glow %:p<CR>"

})
autocmd("FileType", {
    pattern = "markdown",
    command = "nnoremap <Leader>rp :MarkdownPreview<CR>"

})


-- [[ Folding ]]
--
-- " Maple folding between #:[--- and #:---]
autocmd("FileType", { pattern = "maple", command = "setlocal foldmethod=marker" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldmarker=:[---,:---]" })
autocmd("FileType", { pattern = "maple", command = "setlocal commentstring=#%s" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldignore=#" })
autocmd("FileType", { pattern = "maple", command = "setlocal nofoldenable" })
autocmd("FileType", { pattern = "maple", command = "setlocal foldlevelstart=99" })
--
-- FORM folding between *--%[ and *--#]
autocmd("FileType", { pattern = "form", command = "setlocal foldmethod=marker" })
autocmd("FileType", { pattern = "form", command = "setlocal foldmarker=--#[,--#]" })
autocmd("FileType", { pattern = "form", command = "setlocal commentstring=*%s" })
autocmd("FileType", { pattern = "form", command = "setlocal foldignore=*" })
autocmd("FileType", { pattern = "form", command = "setlocal nofoldenable" })
autocmd("FileType", { pattern = "form", command = "setlocal foldlevelstart=99" })
