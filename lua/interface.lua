require('lualine').setup {
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'packer', 'NvimTree' }
  },
  sections = {
    lualine_c = { { 'filename', path = 4 } }
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 4 } }
  },
  tabline = { }
}

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      width = 30,
      adaptive_size = true,
    },
    renderer = {
      group_empty = true,
    },
})

-- autocmd to reopen nvim-tree on restart session
vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require('nvim-tree.api')
    local view = require('nvim-tree.view')

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})
