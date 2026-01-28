local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local null_ls = require("null-ls")


null_ls.setup({
  debug = true,
  sources = {

    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),

    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.stylua,

    -- Prettier como formatador
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.root_has_file({ ".prettierrc", ".prettierrc.js" })
      end,
    }),

    -- ESLint como linter e code action
    -- require("none-ls.diagnostics.eslint_d").with({
    --   condition = function(utils)
    --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
    --   end,
    -- }),
    -- require("none-ls.code_actions.eslint_d"),
  },

  -- Formatar automaticamente ao salvar
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.server_capabilities and type(client.server_capabilities.textDocumentSync) == "boolean" then
      client.server_capabilities.textDocumentSync = 1 -- ou 2 (incremental)
    end

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
          -- vim.lsp.buf.format({ async = false })
          -- vim.lsp.buf.formatting_sync()
        end,
      })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("OrganizeImports", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" }, diagnostics = {} },
          apply = true,
        })
      end,
    })
  end,
})
