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

-- Discord presence configuration
require("presence").setup({
  -- General options
  auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  neovim_image_text = "MASTERPIECE IDE", -- Text displayed when hovered over the Neovim image main_image = "neovim", -- Main image display (either "neovim" or "file")
  client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
  log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  enable_line_number = false, -- Displays the current line number instead of the current project
  blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  show_time = true, -- Show the timer

  -- Rich Presence text options
  editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})

--Show ocult items by default
require("neo-tree").setup({
  filesystem = {
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true, -- This will use the OS level file watchers
      watch_dir_patterns = { "*" },   -- Watch all directories
      bind_to_cwd = true,            -- Ensure Neotree updates when the working directory changes
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    git_status = {
      refresh = {
        delay = 100,                 -- Delay in milliseconds before refreshing git status
        enabled = true,              -- Enable automatic git status refresh
      },
    },})

vim.g.autoformat = false
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.vue", "*.js" },
  callback = function()
    vim.lsp.buf.format = nil
  end,
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

require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
