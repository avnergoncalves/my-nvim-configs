-- require("codeium").setup({})

vim.g.codeium_enabled = 0
vim.g.codeium_disable_bindings = 1

vim.g.codeium_filetypes = {
  TelescopePrompt = false,
}

vim.keymap.set("i", "<Tab>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })

vim.keymap.set("i", "<c-.>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, silent = true })

vim.keymap.set("i", "<c-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })

vim.keymap.set("i", "<C-e>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, silent = true })
