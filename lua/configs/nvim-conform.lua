--- @diagnostic disable: undefined-global

require("conform").setup({
  log_level = vim.log.levels.DEBUG,
  format_on_save = {
    timeout_ms = 2000,
    lsp_fallback = false,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "autoflake", "isort", "black" },
    javascript = { "prettierd" },
    php = { "php-cs-fixer" },
    blade = { "blade-formatter" },
  },
  formatters = {
    autoflake = {
      prepend_args = { "--in-place", "--remove-unused-variables", "--remove-all-unused-imports" },
    },
    ["php-cs-fixer"] = {
      command = "php-cs-fixer",
      args = {
        "fix",
        "--using-cache=no",
        "--quiet",
        "$FILENAME",
      },
      stdin = false,
    },
  },
})
