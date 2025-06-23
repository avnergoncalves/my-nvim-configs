require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})
require("mason-null-ls").setup({
  ensure_installed = nil,
  automatic_installation = true,
})
