function codeium_statusline()
  return "{…} " .. string.gsub(vim.api.nvim_call_function("codeium#GetStatusString", {}), "%s+", "")
end

local colors = {
  color2 = "#0f1419",
  color3 = "#ffee99",
  color4 = "#e6e1cf",
  color5 = "#444155", -- #14191f
  color13 = "#b8cc52",
  color10 = "#36a3d9",
  color8 = "#f07178",
  color9 = "#3e4b59",
}

require("lualine").setup({
  options = {
    theme = {
      visual = {
        a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      replace = {
        a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      inactive = {
        c = { fg = colors.color4, bg = colors.color2 },
        a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      normal = {
        c = { fg = colors.color9, bg = colors.color2 },
        a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      insert = {
        a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
    },
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
    lualine_x = { "copilot", { codeium_statusline }, "encoding", "fileformat", "filetype" },
  },
  inactive_sections = {
    lualine_c = { { "filename", path = 1 } },
  },
  tabline = {},
})
