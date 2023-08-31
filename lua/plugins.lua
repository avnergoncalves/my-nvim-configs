-- Plugins
--------------------------------------------------------------------------------------------------------------------------------
local packer = require("packer")

vim.cmd([[packadd packer.nvim]])

packer.startup(function()
  -- plugins
  use("wbthomason/packer.nvim")

  -- theme
  use("morhetz/gruvbox")
  use("tiagovla/tokyodark.nvim")
  use("ghifarit53/tokyonight-vim")
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- finder
  use("nvim-telescope/telescope.nvim")

  -- completion
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("hrsh7th/nvim-cmp")

  -- snippets
  use("rafamadriz/friendly-snippets")
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")

  -- formatting
  use("jose-elias-alvarez/null-ls.nvim")

  -- language
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")

  -- syntax
  use("nvim-treesitter/nvim-treesitter")
  use("jwalton512/vim-blade")

  -- utilities
  use("windwp/nvim-autopairs")
  use("norcalli/nvim-colorizer.lua")
  use("lewis6991/gitsigns.nvim")
  use("chentoast/marks.nvim")
  use("terrortylor/nvim-comment")
  use("editorconfig/editorconfig-vim")
  use("tpope/vim-surround")
  use("svermeulen/vim-subversive")
  use("tpope/vim-repeat")

  -- dependencies
  use("nvim-lua/plenary.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("MunifTanjim/nui.nvim")

  -- interface
  use("nvim-tree/nvim-tree.lua")
  use("nvim-lualine/lualine.nvim")

  -- session
  use({
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Workspace", "~/Downloads", "/" },
      })
    end,
  })
end)
