local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.intelephense.setup({
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        intelephense = {
            files = {
                maxSize = 1000000,
            },
        },
    },
})
