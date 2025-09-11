return {
  -- motor principal
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- integración con LSP
      "hrsh7th/cmp-buffer",     -- sugerencias del buffer actual
      "hrsh7th/cmp-path",       -- sugerencias de rutas
      "hrsh7th/cmp-cmdline",    -- sugerencias en la línea de comandos
      "L3MON4D3/LuaSnip",       -- snippets
      "saadparwaiz1/cmp_luasnip", -- integración con LuaSnip
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

