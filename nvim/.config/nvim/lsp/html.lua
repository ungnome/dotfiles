return {
    cmd = { "vscode-html-language-server", "--stdio" },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    filetypes = { "html", "templ" },
    root_markers = { "package.json", ".git" },
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
}
