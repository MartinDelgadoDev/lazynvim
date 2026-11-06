return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = "",
        },
     })

    -- Show diagnostics when cursor rests on a line
     vim.api.nvim_create_autocmd("CursorHold", {
         callback = function()
             vim.diagnostic.open_float(nil, {
                 focus = false,
                 scope = "cursor",
                 border = "rounded",
             })
         end,
      })  
      -- Neovim 0.11+ native LSP configuration API.
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "rust_analyzer",
        },
        automatic_enable = true,
      })

      -- Common LSP keymaps. These are created only for buffers with an attached LSP.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }
          local map = vim.keymap.set

          map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
          map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
          map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
          map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
          map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
          map("n", "<leader>e", vim.diagnostic.open_float,vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))
          map("n", "[d", vim.diagnostic.goto_prev,vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
          map("n", "]d", vim.diagnostic.goto_next,vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
          map("n", "<leader>q", vim.diagnostic.setloclist,vim.tbl_extend("force", opts, { desc = "Diagnostics list" }))

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.name == "roslyn" and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          end
        end,
      })
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("roslyn", {
        capabilities = capabilities,
        settings = {
          ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            dotnet_enable_inlay_hints_for_parameters = true,
          },
          ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
          },
        },
      })

      require("roslyn").setup({})
    end,
  },
}
