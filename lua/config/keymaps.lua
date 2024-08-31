--Open errors area
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
