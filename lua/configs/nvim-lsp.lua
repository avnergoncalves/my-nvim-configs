local lspconfig = require("lspconfig")
--
-- local caps = vim.lsp.protocol.make_client_capabilities()
-- local no_format = function(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = false
-- end

-- Capabilities
-- caps.textDocument.completion.completionItem.snippetSupport = true
--
-- vim.lsp.set_log_level("debug")

-- Python
vim.lsp.enable("pyright")
-- lspconfig.pyright.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })

-- PHP
-- vim.lsp.enable("phpactor")
vim.lsp.enable("intelephense")
-- lspconfig.phpactor.setup({ capabilities = caps })

-- JavaScript/Typescript
-- vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")

-- lspconfig.eslint.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })
-- lspconfig.ts_ls.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })

-- Rust
-- vim.lsp.enable("rust_analyzer")
-- lspconfig.rust_analyzer.setup({
--   capabilities = caps,
-- })

-- Emmet
vim.lsp.enable("emmet_ls")
lspconfig.emmet_ls.setup({
  filetypes = {
    "css",
    "html",
    "blade",
    "less",
    "sass",
    "scss",
    "javascriptreact",
    "typescriptreact",
  },
})

-- Lua
vim.lsp.enable("lua_ls")
-- lspconfig.lua_ls.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })
