# NeoVim Configurations


```
  ├── init.lua
  ├── lua/
  │  ├── complete.lua
  │  ├── func.lua
  │  ├── git.lua
  │  ├── keys.lua
  │  ├── lsp.lua
  │  ├── opts.lua
  │  ├── plug.lua
  │  ├── tree.lua
  │  └── vars.lua
  └── README.md
```

The plugins are installed using [packer.nvim](https://github.com/wbthomason/packer.nvim).

 - Syntax Highlight: `treesitter`
 - LSP: native nvim LSP
    - New LSP can be installed with `Mason` and a new line must also be added
        to the `init.lua` file in order to make the LSP available, e.g.,

        ```lua
           require 'lspconfig'.clangd.setup{capabilities=capabilities}
        ```

 - Formatting: `null-ls`
    - running `checkhealth null-ls` will show which command is missing and can
        be installed with `Mason` (e.g. `MasonInstall clang-format`)
 - Autocomplete: `nvim-cmp`
