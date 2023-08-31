require("lualine").setup({
  options = {
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "packer", "NvimTree" },
  },
  sections = {
    lualine_c = { { "filename", path = 4 } },
  },
  inactive_sections = {
    lualine_c = { { "filename", path = 4 } },
  },
  tabline = {},
})
