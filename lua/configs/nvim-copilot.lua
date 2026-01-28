--- @diagnostic disable: undefined-global

-- vim.g.copilot_enabled = false

local copilot = require("copilot")
local copilot_chat = require("CopilotChat")
local select = require("CopilotChat.select")

copilot.setup({
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

copilot_chat.setup({
  -- See Configuration section for options
  -- clear_chat_on_new_prompt = true,
  -- insert_at_end = true,
  -- remember_as_sticky = false,
  window = {
    layout = "float",
    -- relative = "editor",
    width = math.floor(vim.o.columns * 0.4),
    height = math.floor(vim.o.lines * 0.8),
  },
  prompts = {
    PullRequest = {
      prompt = "Generate a Pull Request description aligned with Conventional Commits. Explain the change, its motivation, and how to validate it.",
      description = "Write pull request message",
      sticky = { "#gitdiff:" .. vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'") .. "...HEAD" },
      -- sticky = { "#git:develop...HEAD" },
    },
  },
})

-- require("copilot_cmp").setup()

-- Mapeamento para aceitar sugestão do Copilot com a tecla Right Arrow
vim.keymap.set("i", "<Right>", function()
  local copilot_suggestion = require("copilot.suggestion")
  if copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
  end
end, { expr = false, silent = true, desc = "Accept Copilot suggestion" })

-- Atalho para perguntar ao Copilot Chat, usando seleção ou buffer como contexto
vim.keymap.set({ "n", "v" }, "<leader>ca", function()
  local function get_resource()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" or mode == "\22" then
      -- está em visual mode: usar seleção
      return { "#selection" }, "seleção"
    else
      -- não tem seleção: usar buffer
      return { "#buffer" }, "buffer"
    end
  end

  local function ask_copilot(input)
    if input and input ~= "" then
      copilot_chat.reset()
      local resources, _ = get_resource()
      copilot_chat.ask(input, { sticky = resources })
    end
  end

  -- Use vim.ui.input para melhor integração com plugins de UI
  local _, resource_label = get_resource()
  vim.ui.input({ prompt = "Perguntar ao Copilot (" .. resource_label .. "): " }, ask_copilot)
end, { desc = "Perguntar ao Copilot (seleção > buffer)" })

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode
keymap("n", "<leader>cc", ":CopilotChatOpen<CR>", { desc = "Abrir chat Copilot", unpack(opts) })
keymap("n", "<leader>cq", ":CopilotChatClose<CR>", { desc = "Fechar chat", unpack(opts) })
keymap("n", "<leader>cl", ":CopilotChatReset<CR>", { desc = "Limpar chat", unpack(opts) })
keymap("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "Gerar commit com Copilot", unpack(opts) })
keymap("n", "<leader>cp", ":CopilotChatPullRequest<CR>", { desc = "Gerar pull request message", unpack(opts) })

keymap("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Corrigir código", unpack(opts) })
keymap("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Explicar código", unpack(opts) })
keymap("v", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "Otimizar código", unpack(opts) })
keymap("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Revisar código", unpack(opts) })
keymap("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Documentar código", unpack(opts) })
