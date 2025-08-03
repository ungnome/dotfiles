return {
    cmd = { "terraform-ls", "serve" },
    capabilities = require("blink.cmp").get_lsp_capabilities(),
    filetypes = { "terraform", "terraform-vars" },
    root_markers = { ".terraform", ".git" },
}
