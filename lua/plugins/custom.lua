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
    'luckasRanarison/tailwind-tools.nvim',
  },
  --vue config
  {
    "posva/vim-vue",
    ft = "vue",
  },

  --Git blame -> Reveal commit author
  {
    "APZelos/blamer.nvim"
  },
  {
    'nvim-telescope/telescope.nvim', branch = 'master',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "neanias/everforest-nvim"
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },

  {
    'DaikyXendo/nvim-material-icon'
  },
}
