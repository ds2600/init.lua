local harpoon = require("harpoon")
local instance = harpoon:setup({ default = {} })

vim.keymap.set("n", "<leader>a", function() instance:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(instance:list()) end)
vim.keymap.set("n", "<C-j>", function() instance:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() instance:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() instance:list():select(3) end)
vim.keymap.set("n", "<C-;>", function() instance:list():select(4) end)
vim.keymap.set("n", "<C-p>", function() instance:list():prev() end)
vim.keymap.set("n", "<C-n>", function() instance:list():next() end)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function()
        vim.keymap.set("n", "d", function()
            local idx = vim.fn.line(".")
            instance:list():remove_at(idx)
            harpoon.ui:toggle_quick_menu(instance:list())
            harpoon.ui:toggle_quick_menu(instance:list())
        end, { buffer = true, desc = "remove item" })
    end,
})
