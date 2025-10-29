vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.g.mapleader = " "

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.cmd("filetype plugin indent on")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "php", "html" },
    command = "setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent"
})
