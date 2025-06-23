-- vim.g.copilot_enabled = false

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    suggestion = { enabled = false },
    panel = { enabled = false },
    keymap = {
      -- accept = "<Right>",
      accept = false,
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
})

require("CopilotChat").setup({
  -- See Configuration section for options
  prompts = {
    PR = {
      prompt = "Write pull request message for the change. Keep the title under 50 characters. Format as a markdown.",
      description = "Write pull request message",
      context = "git:develop...HEAD",
    },
  },
})

-- require("copilot_cmp").setup()

vim.keymap.set("i", "<Right>", function()
  local copilot_suggestion = require("copilot.suggestion")
  if copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
  end
end, { expr = false, silent = true, desc = "Accept Copilot suggestion" })

vim.api.nvim_create_user_command("CopilotChatAutoCommit", function()
  require("CopilotChat").ask(
    "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.",
    {
      context = { "git:staged" },
      callback = function(response)
        local commit_msg = response
          :gsub("\n", " ") -- substitui quebras de linha por espaço
          :gsub('"', "") -- remove aspas duplas
          :gsub("^%s*(.-)%s*$", "%1") -- remove espaços no início/fim

        vim.notify("Mensagem gerada: " .. commit_msg)

        local result = vim.fn.system({ "git", "commit", "-m", commit_msg })
        vim.notify("Resultado do commit:\n" .. result)
      end,
    }
  )
end, {})
