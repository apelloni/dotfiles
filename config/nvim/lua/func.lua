-- [[ Functions ]]

local autocmd = vim.api.nvim_create_autocmd

-- Trim trailing white spaces
autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

-- Trim trailing lines
    autocmd({"BufWritePre"},{
    pattern = { "*" },
    command = [[silent! %s#\($\n\s*\)\+\%$##]]
})

-- Remember last position
autocmd({"BufReadPost"},{
    desc = 'Open file at the last position it was edited earlier',
    pattern = '*',
    command = 'silent! normal! g`"zv',
})
