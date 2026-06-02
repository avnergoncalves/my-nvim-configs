--- @diagnostic disable: undefined-global

require("tree-sitter-manager").setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "php",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "bash",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "blade",
  },
  auto_install = true,
  highlight = false,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.autoindent = true
      vim.bo.smartindent = true
    end
  end,
  desc = "Enable treesitter highlighting and indentation defaults",
})
