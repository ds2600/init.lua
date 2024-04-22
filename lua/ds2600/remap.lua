vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Map <leader>pnf to create new file in netrw
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>pnf', ':lua CreateNewFileInNetrw()<CR>', {noremap = true, silent = true})
    end
})

function CreateNewFileInNetrw()
    local filename = vim.fn.input('New File Name: ')
    if filename ~= '' then
        vim.cmd('edit ' .. vim.fn.expand('%:p:h') .. '/' .. filename)
    end
end
