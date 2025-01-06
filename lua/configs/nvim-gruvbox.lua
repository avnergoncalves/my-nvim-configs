require("gruvbox").setup({
  contrast = "hard",
  overrides = {
    -- ["@variable"] = { fg = "#83a598" },
    ["@variable.parameter"] = { fg = "#ebdbb2" },
    ["@variable.member"] = { fg = "#ebdbb2" },
  },
})

vim.cmd("colorscheme gruvbox")
