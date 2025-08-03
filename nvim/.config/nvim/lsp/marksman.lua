return {
    cmd = { "marksman", "server" },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    filetypes = { "markdown", "markdown.mdx" },
    root_markers = { ".marksman.toml", ".git" },
}
