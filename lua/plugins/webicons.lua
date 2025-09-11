return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- se carga solo cuando algún plugin lo requiere
    config = function()
      require("nvim-web-devicons").setup {
        default = true, -- usar iconos por defecto si no hay un icono específico
      }
    end,
  },
}

