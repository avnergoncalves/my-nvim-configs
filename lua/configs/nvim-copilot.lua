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
  window = {
    layout = "float",
    relative = "cursor",
    width = 1,
    height = 0.4,
    row = 1,
  },
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
    "Write a commit message following the commitizen convention. Keep the title under 50 characters and the body wrapped at 72 characters. Respond only with the message, formatted as a gitcommit code block.",
    {
      context = { "git:staged" },
      callback = function(response)
        -- Remove blocos de código (```gitcommit ... ```)
        local clean_msg = response:gsub("^```gitcommit%s*", ""):gsub("```%s*$", ""):gsub("\r", "")

        -- Quebra a string em linhas
        local lines = {}
        for line in clean_msg:gmatch("[^\n]+") do
          table.insert(lines, line)
        end

        local title = lines[1] or ""
        local description = table.concat(vim.list_slice(lines, 2), "\n")

        -- Valida título
        if title == "" then
          vim.notify("Título do commit está vazio. Cancelando.", vim.log.levels.ERROR)
          return
        end

        -- Faz o commit
        local args = { "git", "commit", "-m", title }
        if description and description:match("%S") then
          table.insert(args, "-m")
          table.insert(args, description)
        end

        vim.notify("Commit:\n" .. title .. "\n\n" .. description)
        local result = vim.fn.system(args)
        vim.notify("Resultado do commit:\n" .. result)
      end,
    }
  )
end, {})
