vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local tw = vim.opt_local.textwidth:get()
    if tw > 0 then
      vim.opt_local.colorcolumn = tostring(tw)
    else
      vim.opt_local.colorcolumn = ""
    end
  end,
})
