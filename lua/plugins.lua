-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- add plugins
require("lazy").setup({
  -- theme
  { "ellisonleao/gruvbox.nvim", priority = 1000, lazy = false },
  -- "tiagovla/tokyodark.nvim",
  -- "ghifarit53/tokyonight-vim"
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- finder
  "nvim-telescope/telescope.nvim",

  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "f3fora/cmp-spell",
    },
  },

  -- AI
  -- "AndreM222/copilot-lualine",
  -- "zbirenbaum/copilot.lua",
  "github/copilot.vim",
  "Exafunction/codeium.vim",

  -- snippets
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- formatting
  "jose-elias-alvarez/null-ls.nvim",

  -- language
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "jwalton512/vim-blade",

  -- utilities
  "christoomey/vim-tmux-navigator",
  "windwp/nvim-autopairs",
  "norcalli/nvim-colorizer.lua",
  "lewis6991/gitsigns.nvim",
  "chentoast/marks.nvim",
  "terrortylor/nvim-comment",
  "editorconfig/editorconfig-vim",
  "tpope/vim-surround",
  "svermeulen/vim-subversive",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  { "linux-cultist/venv-selector.nvim", branch = "regexp" },
  "onsails/lspkind.nvim",
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- dependencies
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  "MunifTanjim/nui.nvim",

  -- interface
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  "liuchengxu/vista.vim",
  "simrat39/symbols-outline.nvim",

  -- session
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Workspace", "~/Downloads", "/" },
      })
    end,
  },
})
