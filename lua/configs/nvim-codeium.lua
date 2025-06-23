-- require("codeium").setup({})

vim.g.codeium_enabled = 0
vim.g.codeium_disable_bindings = 1
vim.g.codeium_no_map_tab = 1

vim.g.codeium_filetypes = {
  TelescopePrompt = false,
}

vim.keymap.set("i", "<Right>", function()
  local status, completion_text = pcall(function()
    return vim.api.nvim_eval("b:_codeium_completions.items[b:_codeium_completions.index].completionParts[0].text")
  end)
  if not (status and completion_text and completion_text ~= "") then
    return vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
  else
    return vim.fn["codeium#Accept"]()
  end
end, { expr = true, silent = true })

-- vim.keymap.set("i", "<M-]>", function()
--   return vim.fn["codeium#CycleCompletions"](1)
-- end, { expr = true, silent = true })
--
-- vim.keymap.set("i", "<M-[>", function()
--   return vim.fn["codeium#CycleCompletions"](-1)
-- end, { expr = true, silent = true })
--
-- vim.keymap.set("i", "<C-]>", function()
--   return vim.fn["codeium#Clear"]()
-- end, { expr = true, silent = true })
