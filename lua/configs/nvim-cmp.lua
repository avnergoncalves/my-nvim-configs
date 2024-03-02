local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  view = {
    entries = { name = "custom", selection_order = "top_down", vertical_positioning = "above" },
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
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    -- { name = "spell" },
    { name = "path" },
  }),
  formatting = {
    fields = { cmp.ItemField.Abbr, cmp.ItemField.Menu },
    format = function(entry, vim_item)
      vim_item.menu = " "
        .. (({ nvim_lsp = "lsp", cmp_git = "git" })[entry.source.name] or entry.source.name)
        .. ": "
        .. vim_item.kind
      vim_item.kind = nil
      return vim_item
    end,
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
