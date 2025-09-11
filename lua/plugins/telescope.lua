return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope", 
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<CR>", noremap = true, silent = true },
      { "<C-p>", "<cmd>Telescope git_files<CR>", noremap = true, silent = true },
      { "<leader>ps", function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end, noremap = true, silent = true
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
          path_display = { "smart" },
        },
      })
    end,
  },
}

