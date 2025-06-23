vim.g.mapleader = " "

-- settings
vim.cmd([[
  filetype plugin indent on
  syntax on
]])

-- spell
vim.opt.spell = true
vim.opt.spelllang = { "en", "pt_br" }

-- strip whitespace
vim.g.better_whitespace_enabled = 0
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0

-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
vim.g.qs_max_chars = 150

vim.g.editorconfig = true

local set = vim.opt

set.background = "dark"
set.clipboard = "unnamedplus"
set.completeopt = "noinsert,menuone,noselect"
set.cursorline = true
set.expandtab = true
set.hidden = true
set.inccommand = "split"
set.mouse = "a"
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.updatetime = 250
set.wildmenu = true
set.wrap = true
set.ignorecase = true
set.smartcase = true
set.signcolumn = "yes:2"
set.showtabline = 1
set.colorcolumn = "129"
set.undofile = true

set.listchars:append({ tab = "→ " })
set.listchars:append({ space = "·" })
set.listchars:append({ nbsp = "␣" })
set.listchars:append({ eol = "¶" })
set.listchars:append({ precedes = "«" })
set.listchars:append({ extends = "»" })
set.list = true

set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldmethod = "manual"
