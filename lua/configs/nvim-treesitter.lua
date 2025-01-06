require("nvim-treesitter.configs").setup({
  auto_install = true,
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
  highlight = { enable = true },
  indent = { enable = true },
  -- refactor = {
  --   highlight_definitions = { enable = true },
  -- },
  -- autotag = {
  --   enable = true,
  -- },
  -- context_commentstring = {
  --   enable = true,
  --   config = {
  --     javascriptreact = {
  --       style_element = "{/*%s*/}",
  --     },
  --   },
  -- },
})

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
