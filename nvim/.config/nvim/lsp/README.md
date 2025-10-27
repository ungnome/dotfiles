## About

This directory is for lsp server configuration tweaks. Current "defaults" are
provided by the [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) plugin.

Each `<serverName>.lua` file name must match must match the enabled server name.

**Example**:
``` lua
return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "templ" },
    root_markers = { "package.json", ".git" },
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
}
```
