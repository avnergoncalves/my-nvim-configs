function codeium_statusline()
  return "{…} " .. string.gsub(vim.api.nvim_call_function("codeium#GetStatusString", {}), "%s+", "")
end

require("lualine").setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "Outline", "vista_markdown", "vista_kind" },
    refresh = {
      statusline = 200, -- Note these are in mili second and default is 1000
      tabline = 500,
      winbar = 300,
    },
  },
  sections = {
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { { codeium_statusline }, "encoding", "fileformat", "filetype" },
  },
  inactive_sections = {
    lualine_c = { { "filename", path = 1 } },
  },
  tabline = {},
})
