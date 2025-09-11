return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
          ensure_installed = {"javascript","python","html","go","typescript","css","c", "lua", "vim", "vimdoc", "query",
                -- !
                "c_sharp",
                "razor"
                    },
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

