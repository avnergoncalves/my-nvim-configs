require("nvim-treesitter.configs").setup({
  auto_install = true,
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "php",
    "javascript",
    "typescript",
    "html",
    "blade",
    "css",
    "json",
    "bash",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
  },
  indent = { enable = true },
  highlight = { enable = true },
  matchup = { enable = true },
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

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "html",
  },
})
