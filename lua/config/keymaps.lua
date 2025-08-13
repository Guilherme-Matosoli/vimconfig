local replaceFunc = require("utils.replace")

--Open errors area
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)

-- Go to definition -> where the function under the cursor is allocated
vim.keymap.set('v', "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>")

-- Find files by content
vim.keymap.set('n', "<leader>fp", ":Telescope live_grep<CR>", { desc = "Find files by content" })

-- Set up select mode mappings
vim.keymap.set('s', 'S', function()
  vim.cmd('normal! gv')
  vim.api.nvim_feedkeys('S', 'n', true)
end, { desc = 'Surround in select mode' })

-- Rename declarations
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)

-- Move select texts up or down
vim.keymap.set("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
vim.keymap.set("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })

vim.keymap.set("n", "<leader>R", replaceFunc.search_replace_modal, { desc = "Search and Replace Modal" })
