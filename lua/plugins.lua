--- @diagnostic disable: undefined-global

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
  {
    "sudo-tee/opencode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          anti_conceal = { enabled = false },
          file_types = { "markdown", "opencode_output" },
        },
        ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
      },
    },
  },

  -- snippets
  "rafamadriz/friendly-snippets",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- language and formatting
  "neovim/nvim-lspconfig",
  "stevearc/conform.nvim",
  -- "nvimtools/none-ls.nvim",
  -- "nvimtools/none-ls-extras.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "zapling/mason-conform.nvim",
  -- "jay-babu/mason-null-ls.nvim",

  -- syntax
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "EmranMR/tree-sitter-blade" },
  {
    "andymass/vim-matchup",
    event = { "BufReadPost" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      -- vim.g.matchup_matchpref = {
      --   html = { tagnameonly = 1 },
      --   blade = { tagnameonly = 1 },
      -- }
    end,
  },

  -- utilities
  "rainbowhxch/accelerated-jk.nvim",
  "christoomey/vim-tmux-navigator",
  "windwp/nvim-autopairs",
  "tpope/vim-fugitive",
  "terrortylor/nvim-comment",
  "tpope/vim-surround",
  "svermeulen/vim-subversive",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  { "linux-cultist/venv-selector.nvim" },
  "onsails/lspkind.nvim",
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
  },
  -- "j-hui/fidget.nvim",
  -- {
  --   "dstein64/vim-startuptime",
  --   cmd = "StartupTime",
  --   init = function()
  --     vim.g.startuptime_tries = 10
  --   end,
  -- },

  -- dependencies
  "nvim-lua/plenary.nvim",
  { "nvim-tree/nvim-web-devicons", lazy = true },
  "MunifTanjim/nui.nvim",

  -- interface
  "nvim-tree/nvim-tree.lua",
  "nvim-lualine/lualine.nvim",
  -- "liuchengxu/vista.vim",
  "lewis6991/gitsigns.nvim",
  "norcalli/nvim-colorizer.lua",
  "chentoast/marks.nvim",

  -- session
  "rmagatti/auto-session",
})
