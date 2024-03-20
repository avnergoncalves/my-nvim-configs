require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

-- Pylsp
-- lspconfig.pylsp.setup({
--   cmd = {
--     "docker",
--     "compose",
--     "-f",
--     "docker-compose.yml",
--     "exec",
--     "-T",
--     "backend",
--     "pylsp",
--   },
--   root_dir = require("lspconfig/util").root_pattern(".git", vim.fn.getcwd()),
-- })

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
lspconfig.tsserver.setup({
  capabilities = caps,
  on_attach = no_format,
})

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = snip_caps,
  on_attach = no_format,
})

-- Emmet
lspconfig.emmet_ls.setup({
  capabilities = snip_caps,
  filetypes = {
    "css",
    "html",
    "blade",
    "less",
    "sass",
    "scss",
    -- "javascriptreact",
    -- "typescriptreact",
  },
})
