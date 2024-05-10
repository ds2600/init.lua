local lsp = require('lsp-zero')

lsp.preset('recommended')

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        'lexical',
        'phpactor',
    },
    automatic_installation = true
})
lsp.setup()
