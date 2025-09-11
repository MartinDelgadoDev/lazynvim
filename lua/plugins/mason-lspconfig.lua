return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
  config = function()
    require("config.lsp") -- aquí llamas a tu configuración personalizada
  end,
}

