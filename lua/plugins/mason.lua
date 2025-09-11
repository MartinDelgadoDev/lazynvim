return {
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "rust-analyzer",
        "bicep-lsp",
        "stylua",
        "prettier",
        "csharpier",
        "xmlformatter",
        "roslyn",
        "rzls",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      automatic_installation = true, -- esto hará que Mason instale todo de ensure_installed
    },
  },
}

