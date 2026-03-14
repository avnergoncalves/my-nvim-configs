local api = require("opencode.api")
local feed_keys

local function smart_up()
  local before = vim.api.nvim_win_get_cursor(0)
  local mode = vim.api.nvim_get_mode().mode

  if mode:sub(1, 1) == "i" then
    feed_keys("<C-o>gk")
  else
    feed_keys("gk")
  end

  vim.schedule(function()
    local after = vim.api.nvim_win_get_cursor(0)
    if after[1] == before[1] and after[2] == before[2] then
      api.prev_history()
    end
  end)
end

local function smart_down()
  local before = vim.api.nvim_win_get_cursor(0)
  local mode = vim.api.nvim_get_mode().mode

  if mode:sub(1, 1) == "i" then
    feed_keys("<C-o>gj")
  else
    feed_keys("gj")
  end

  vim.schedule(function()
    local after = vim.api.nvim_win_get_cursor(0)
    if after[1] == before[1] and after[2] == before[2] then
      api.next_history()
    end
  end)
end

feed_keys = function(keys)
  local termcodes = vim.api.nvim_replace_termcodes(keys, true, false, true)
  vim.api.nvim_feedkeys(termcodes, "n", true)
end

require("opencode").setup({
  preferred_picker = "telescope",
  preferred_completion = "nvim-cmp",
  keymap = {
    input_window = {
      ["<up>"] = {
        function()
          smart_up()
        end,
        mode = { "n", "i" },
      },
      ["<down>"] = {
        function()
          smart_down()
        end,
        mode = { "n", "i" },
      },
    },
  },
})
