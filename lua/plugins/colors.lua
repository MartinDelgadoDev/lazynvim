return {
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- para que cargue antes de otros colores
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          comments = true,
          operators = false,
          folds = true,
        },
        inverse = true,    -- invierte highlights para Search, etc.
        contrast = "soft", -- opciones: "soft" | "medium" | "hard"
        overrides = {},
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Iconos para archivos
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}

