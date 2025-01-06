local actions = require("telescope.actions")

require("telescope").setup({
  pickers = {
    buffers = {
      sort_mru = true,
    },
  },
  defaults = {
    path_display = { "filename_first" },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-c>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
})
