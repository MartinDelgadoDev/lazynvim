return {
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lspsaga").setup({
        -- configuración básica
        use_saga_diagnostic_sign = true,   -- muestra iconos en la línea
        diagnostic_header = { " ", " ", " ", "ﴞ " }, -- icons
        code_action_lightbulb = {
          enable = true,
          sign = true,
          virtual_text = true,
        },
        -- ajustar floating windows
        border_style = "rounded",
      })
    end,
  },
}

