local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
   "williamboman/mason.nvim",
   opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "clangd",
        "intelephense",
        "rust-analyzer",
        "php-cs-fixer",
        "deno",
      },
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false, 
    config = function()
      require("auto-session").setup({
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      })
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "BufEnter",
    config = function()
      require("neoscroll").setup({
         mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                     '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
         hide_cursor = true,          -- Hide cursor while scrolling
         stop_eof = true,             -- Stop at <EOF> when scrolling downwards
         respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
         cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
         easing_function = nil,       -- Default easing function
         pre_hook = nil,              -- Function to run before the scrolling animation starts
         post_hook = nil,             -- Function to run after the scrolling animation ends
         performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      })
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  -- {
  --   "folke/which-key.nvim",
  --   enabled = true,
  -- },
}

return plugins
