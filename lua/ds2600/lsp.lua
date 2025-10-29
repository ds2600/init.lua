local lspconfig = vim.lsp.config

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.start({
    name = "pyright",
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json" }, { upward = true })[1]),
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.start({
    name = "ts_ls",
    cmd = { "typescript-language-server", "--stdio"},
    root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" }, { upward = true })[1]),
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.lsp.start({
    name = "intelephense",
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = vim.fs.dirname(vim.fs.find({ "composer.json", ".git" }, { upward = true })[1]),
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
