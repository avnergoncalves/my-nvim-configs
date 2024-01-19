local formatting = require("null-ls").builtins.formatting
local lint = require("null-ls").builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  debug = true,
  sources = {
    formatting.isort,
    formatting.black,
    formatting.rustfmt,
    formatting.phpcsfixer,
    formatting.eslint_d,
    formatting.prettierd,
    formatting.stylua,

    -- lint.shellcheck,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
        end,
      })
    end
  end,
})
