require("venv-selector").setup({
  -- enable_debug_output = true,
  auto_refresh = true,
  parents = 0,
  name = { ".venv" },
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>cs", "<cmd>VenvSelect<cr>" },
    -- { "<leader>cv", "<cmd>VenvSelectCached<cr>" },
  },
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--   desc = "Auto select virtualenv Nvim open",
--   pattern = "*",
--   callback = function()
--     local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
--     if venv ~= "" then
--       require("venv-selector").retrieve_from_cache()
--     end
--   end,
--   once = true,
-- })
