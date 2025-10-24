
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n","<leader>r","<cmd>!dotnet run<CR>")

-- Keymap global
vim.keymap.set("n","<leader>n", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

local map = vim.keymap.set
local opts = { silent = true }

