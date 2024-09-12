--Open errors area
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)

vim.keymap.set('v', "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
