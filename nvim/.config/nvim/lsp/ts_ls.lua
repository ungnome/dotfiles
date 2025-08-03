return {
    cmd = { "typescript-language-server", "--stdio" },
    capabilities = require('blink.cmp').get_lsp_capabilities(),
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
}
