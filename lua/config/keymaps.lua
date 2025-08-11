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
