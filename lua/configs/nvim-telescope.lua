local actions = require("telescope.actions")

require("telescope").setup({
  pickers = {
    buffers = {
      sort_mru = true,
      -- ignore_current_buffer = true,
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-c>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})
