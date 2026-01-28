-- local caps = vim.lsp.protocol.make_client_capabilities()
-- caps.textDocument.completion.completionItem.snippetSupport = true
--
-- local no_format = function(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = false
-- end

-- vim.lsp.set_log_level("debug")

-- Python
vim.lsp.enable("pyright")
-- vim.lsp.config("pyright", {
--   capabilities = caps,
--   on_attach = no_format,
-- })

-- PHP
-- vim.lsp.enable("phpactor")
vim.lsp.enable("intelephense")
-- vim.lsp.config.phpactor.setup({ capabilities = caps })

-- JavaScript/Typescript
-- vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")

-- vim.lsp.config.eslint.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })
-- vim.lsp.config.ts_ls.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })

-- Rust
-- vim.lsp.enable("rust_analyzer")
-- vim.lsp.config.rust_analyzer.setup({
--   capabilities = caps,
-- })

-- Emmet
-- @diagnostic disable: undefined-global

vim.lsp.enable("emmet_ls")
-- require("lspconfig").emmet_ls.setup({
--   filetypes = {
--     "css",
--     "html",
--     "blade",
--     "less",
--     "sass",
--     "scss",
--     "javascriptreact",
--     "typescriptreact",
--   },
-- })

-- Lua
vim.lsp.enable("lua_ls")
-- vim.lsp.config.lua_ls.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })
