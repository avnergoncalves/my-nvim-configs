local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  -- experimental = {
  --   ghost_text = { hlgroup = "Comment" },
  -- },
  view = {
    entries = { name = "custom", selection_order = "top_down", vertical_positioning = "above" },
    -- entries = { name = "custom", follow_cursor = true },
  },
  performance = {
    max_view_entries = 10,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    -- ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "codeium" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    -- { name = "spell" },
    { name = "path" },
  }),
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      show_labelDetails = true,
      symbol_map = { Codeium = "" },
      before = function(entry, vim_item)
        vim_item.menu = ({
          codeium = "[Codeium]",
          luasnip = "[LuaSnip]",
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          nvim_lua = "[Lua]",
          path = "[Path]",
        })[entry.source.name] or entry.source.name
        return vim_item
      end,
    }),
  },
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline("/", {
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
