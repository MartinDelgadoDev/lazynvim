return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs")
            .setup({
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = { enable = true,
                    additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}

