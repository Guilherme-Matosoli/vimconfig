-- ~/.config/nvim/lua/plugins/biome.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    opts = function(_, opts)
      local servers = opts.servers or {}
      
      servers.biome = {
        cmd = { "bunx", "@biomejs/biome", "lsp-proxy" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
        root_dir = require("lspconfig.util").root_pattern("biome.json", "biome.jsonc", "package.json", ".git"),
        single_file_support = true,
        init_options = {},
        settings = {},
      }
      
      opts.servers = servers
      return opts
    end,
  },
}
