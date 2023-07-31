local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Clean highlight search
map("n", "<leader><space>", ':noh<cr>', opts)

-- Move windows
map("n", "<C-J>", '<C-W><C-J>', opts)
map("n", "<C-K>", '<C-W><C-K>', opts)
map("n", "<C-L>", '<C-W><C-L>', opts)
map("n", "<C-H>", '<C-W><C-H>', opts)
 
-- Diagnostic
-- kmap("n", "<leader>e", vim.diagnostic.open_float, opts)
kmap("n", "[d", vim.diagnostic.goto_prev, opts)
kmap("n", "]d", vim.diagnostic.goto_next, opts)
kmap("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Telescope
local builtin = require('telescope.builtin')
kmap('n', '<leader>f', builtin.find_files, opts)
kmap('n', '<leader>g', builtin.live_grep, opts)
kmap('n', '<leader>b', builtin.buffers, opts)
kmap('n', '<leader>h', builtin.help_tags, opts)

-- Nvin tree
map("n", "<C-b>", ':NvimTreeToggle<CR>', opts)
map("n", "<C-f>", ':NvimTreeFindFile<CR>', opts)

-- Subversive
map("n", "s", '<plug>(SubversiveSubstitute)', opts)
map("x", "p", '<plug>(SubversiveSubstitute)', opts)
map("x", "P", '<plug>(SubversiveSubstitute)', opts)
