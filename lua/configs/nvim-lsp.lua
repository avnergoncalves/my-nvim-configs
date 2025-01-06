require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
end

-- Capabilities
caps.textDocument.completion.completionItem.snippetSupport = true

-- Python
lspconfig.pyright.setup({
  capabilities = caps,
  on_attach = no_format,
})

-- PHP
lspconfig.phpactor.setup({ capabilities = caps })

-- JavaScript/Typescript
-- lspconfig.eslint.setup({
--   capabilities = caps,
--   on_attach = no_format,
-- })

-- JavaScript/Typescript
lspconfig.ts_ls.setup({
  -- capabilities = caps,
  -- on_attach = no_format,
})

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = caps,
})

-- Emmet
-- lspconfig.emmet_ls.setup({
--   capabilities = caps,
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
