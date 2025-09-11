local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Función de keymaps al adjuntar LSP
local on_attach = function(_, bufnr)
  local map = vim.keymap.set
  local opts = { buffer = bufnr, silent = true }
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- 🔹 Servidores soportados oficialmente en lspconfig
local servers = {
  "lua_ls",
  "ts_ls", -- reemplazo de tsserver
  "jsonls",
  "html",
  "cssls",
  "eslint",
  "rust_analyzer",
  "bicep",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- 🔹 OmniSharp (C#)
lspconfig.omnisharp.setup({
  cmd = { vim.fn.stdpath("data") .. "/mason/bin/OmniSharp" }, -- Mason se encarga del binario
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = util.root_pattern("*.sln", "*.csproj", ".git"),
  -- Opciones adicionales recomendadas para OmniSharp
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = true,
})


