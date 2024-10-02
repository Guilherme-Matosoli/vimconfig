--Open errors area
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)

-- Go to definition -> where the function under the cursor is allocated
vim.keymap.set('v', "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>")

-- Find files by content
vim.keymap.set('n', "<leader>fg", ":Telescope live_grep<CR>")
