local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local cmd = vim.cmd

local opts = { noremap = true, silent = true }

-- save, save/quit, and esc
cmd([[
  nnoremap <silent> <C-s> :w<CR>
  nnoremap <silent> <C-Q> :wq<CR>
]])

-- Clean highlight search
map("n", "<leader><space>", ":noh<cr>", opts)

-- Move windows
map("n", "<C-J>", "<C-W><C-J>", opts)
map("n", "<C-K>", "<C-W><C-K>", opts)
map("n", "<C-L>", "<C-W><C-L>", opts)
map("n", "<C-H>", "<C-W><C-H>", opts)

-- Diagnostic
kmap("n", "[d", vim.diagnostic.goto_prev, opts)
kmap("n", "]d", vim.diagnostic.goto_next, opts)
kmap("n", "<leader>q", vim.diagnostic.setloclist, opts)
-- kmap("n", "<leader>e", vim.diagnostic.open_float, opts)

-- Telescope
local builtin = require("telescope.builtin")
kmap("n", "<leader>d", builtin.diagnostics, opts)
kmap("n", "<leader>f", builtin.find_files, opts)
kmap("n", "<leader>g", builtin.live_grep, opts)
kmap("n", "<leader>b", builtin.buffers, opts)
kmap("n", "<leader>h", builtin.help_tags, opts)
kmap("n", "<leader>r", builtin.registers, opts)

-- Nvin tree
map("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
map("n", "<C-f>", ":NvimTreeFindFile<CR>", opts)

-- Subversive
map("n", "s", "<plug>(SubversiveSubstitute)", opts)
map("x", "p", "<plug>(SubversiveSubstitute)", opts)
map("x", "P", "<plug>(SubversiveSubstitute)", opts)

-- LuaSnip
local ls = require("luasnip")

kmap({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })

kmap({ "i", "s" }, "<C-H>", function()
  ls.jump(-1)
end, { silent = true })
