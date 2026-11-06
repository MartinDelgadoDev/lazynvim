# Neovim configuration

## C# / .NET 10 setup

This configuration uses the current Roslyn language server through `seblyng/roslyn.nvim`.
It requires Neovim 0.12+, the .NET 10 SDK/runtime, and the Roslyn language-server tool.

### 1. Install Roslyn language server

Recommended Microsoft development feed:

```bash
dotnet tool install -g roslyn-language-server --prerelease --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json
```

If it is already installed, update it with:

```bash
dotnet tool update -g roslyn-language-server --prerelease --source https://pkgs.dev.azure.com/azure-public/vside/_packaging/vs-impl/nuget/v3/index.json
```

Make sure the global .NET tools directory is on PATH. For Bash, add this to `~/.bashrc`:

```bash
export PATH="$PATH:$HOME/.dotnet/tools"
```

For Zsh, add the same line to `~/.zshrc`. Restart the terminal/Neovim after changing PATH.

Verify:

```bash
roslyn-language-server --version
dotnet tool list -g
```

### 2. Install/update Neovim plugins

Open Neovim and run:

```vim
:Lazy sync
```

Then install the C# Tree-sitter parser:

```vim
:TSInstall c_sharp
```

### 3. Open a real .NET project

Open the folder containing the `.sln`, `.slnx`, or `.csproj` file, not just an isolated `.cs` file:

```bash
cd /path/to/YourSolution
nvim .
```

Roslyn discovers a solution at the workspace root or discovers project files below it.

### 4. Verify LSP

Inside a C# buffer, run:

```vim
:checkhealth vim.lsp
:LspInfo
```

Useful keymaps:

- `gd`: go to definition
- `gr`: find references
- `K`: hover documentation
- `<leader>rn`: rename symbol
- `<leader>ca`: code action / quick fix
- `<leader>gf`: format buffer (Roslyn formats C#)

The existing plugins and general workflow are retained. LSP Zero was removed because this setup uses Neovim's native LSP API (available in Neovim 0.11+) and the current Mason integration. Lspsaga is declared only once.
