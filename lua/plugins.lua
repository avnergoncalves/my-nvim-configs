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
      "zbirenbaum/copilot-cmp",
    },
  },

  -- AI
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
  },
  "zbirenbaum/copilot.lua",
  "AndreM222/copilot-lualine",
  "Exafunction/codeium.vim",
  "huggingface/llm.nvim",

  -- snippets
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- language and formatting
  "neovim/nvim-lspconfig",
  "nvimtools/none-ls.nvim",
  "nvimtools/none-ls-extras.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jay-babu/mason-null-ls.nvim",
  "j-hui/fidget.nvim",

  -- syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- { "EmranMR/tree-sitter-blade" },
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_matchpref = {
        html = { tagnameonly = 1 },
        blade = { tagnameonly = 1 },
      }
    end,
  },
  -- "jwalton512/vim-blade",

  -- utilities
  "christoomey/vim-tmux-navigator",
  "windwp/nvim-autopairs",
  "norcalli/nvim-colorizer.lua",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "chentoast/marks.nvim",
  "terrortylor/nvim-comment",
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
  -- "antosha417/nvim-lsp-file-operations",

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
