return {
  --discord presence
  { "andweeb/presence.nvim" },

  --make vim transparent
  {
    "xiyaowong/transparent.nvim",
  },

  --Errors area in lead x
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  --tailwind autocomplete
  {
    "luckasRanarison/tailwind-tools.nvim",
  },

  --vue config
  {
    "posva/vim-vue",
    ft = "vue",
  },

  --Styled-components syntax highlighting
  {
    "styled-components/vim-styled-components",
  },
}
