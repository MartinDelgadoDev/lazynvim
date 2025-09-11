vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n","<leader>r","<cmd>!dotnet run<CR>")

-- Keymap global
vim.keymap.set("n","<leader>n", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

local map = vim.keymap.set
local opts = { silent = true }

-- Mostrar diagnóstico en línea
  map("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)


