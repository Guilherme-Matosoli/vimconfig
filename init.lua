vim.g.blamer_enabled = true
vim.g.blamer_show_in_visual_modes = true

-- disable mouse clicks
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd('set mouse=""')
  end,
})

--disbale relative number by default
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   pattern = "*",
--   command = "set norelativenumber",
-- })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- make neotree transparent
require("transparent").clear_prefix("NeoTree")

--Show ocult items by default
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd([[ setlocal relativenumber ]])
      end,
    },
  },
})

vim.g.autoformat = false
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.vue", "*.js" },
  callback = function()
    vim.lsp.buf.format = nil
  end,
})

require("lspconfig").vtsls.setup({
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "none" },
        parameterTypes = { enabled = false },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = false },
        functionLikeReturnTypes = { enabled = false },
        enumMemberValues = { enabled = false },
      },
    },
    javascript = {
      inlayHints = {
        parameterNames = { enabled = "none" },
        parameterTypes = { enabled = false },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = false },
        functionLikeReturnTypes = { enabled = false },
        enumMemberValues = { enabled = false },
      },
    },
  },
})

require("lspconfig").tsserver.setup({
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/home/matos/.npm-global/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

require("nvim-web-devicons").setup({
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh",
    },
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
})
