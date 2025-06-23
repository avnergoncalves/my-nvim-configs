local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local null_ls = require("null-ls")
null_ls.setup({
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
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
        end,
      })
    end

    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   group = vim.api.nvim_create_augroup("OrganizeImports", { clear = true }),
    --   buffer = bufnr,
    --   callback = function()
    --     vim.lsp.buf.code_action({
    --       context = { only = { "source.organizeImports" }, diagnostics = {} },
    --       apply = true,
    --     })
    --   end,
    -- })
  end,
})
