require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  refactor = {
    highlight_definitions = { enable = true },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    config = {
      javascriptreact = {
        style_element = "{/*%s*/}",
      },
    },
  },
})

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.blade = {
--   install_info = {
--     url = "https://github.com/EmranMR/tree-sitter-blade",
--     files = { "src/parser.c" },
--     branch = "main",
--   },
--   filetype = "blade",
-- }

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})

-- blade files
-- vim.cmd([[
--   autocmd BufRead,BufNewFile *.blade.php set filetype=blade
-- ]])
