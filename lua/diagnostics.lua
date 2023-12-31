vim.diagnostic.config({
  float = { source = "always" },
  virtual_text = false,
  signs = true,
})

vim.keymap.set("n", "<leader>e", function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      found_float = true
    end
  end

  if found_float then
    return
  end

  vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end, { desc = "Toggle Diagnostics" })
