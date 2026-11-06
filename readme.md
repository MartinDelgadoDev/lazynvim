## Installation

This repository contains my personal Neovim configuration based on LazyVim.

### Requirements

Before installing, make sure you have the following tools:

- [Neovim](https://neovim.io/)
- [Git](https://git-scm.com/)
- [Nerd Font](https://www.nerdfonts.com/) (recommended for icons)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (recommended)
- [fd](https://github.com/sharkdp/fd) (recommended)

Some plugins may also require additional tools such as Node.js, Python, a C compiler, or other language-specific dependencies.

---

### Windows Installation

**1. Install the required tools**

Open PowerShell and run:

```powershell
winget install Neovim.Neovim
winget install Git.Git
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
```

Restart your terminal after installation.

**2. Backup your existing configuration (if applicable)**

```powershell
if (Test-Path "$env:LOCALAPPDATA\nvim") {
    Rename-Item "$env:LOCALAPPDATA\nvim" "nvim_backup"
}
```

**3. Clone this repository**

```powershell
git clone https://github.com/MartinDelgadoDev/lazynvim.git "$env:LOCALAPPDATA\nvim"
```

**4. Start Neovim**

```powershell
nvim
```

Lazy.nvim should automatically download and install the configured plugins.

---

### Linux Installation

**1. Install the required tools**

For Arch Linux:

```bash
sudo pacman -S neovim git ripgrep fd
```

For Ubuntu/Debian:

```bash
sudo apt update
sudo apt install neovim git ripgrep fd-find
```

Install a Nerd Font and configure your terminal to use it.

**2. Backup your existing configuration (if applicable)**

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

**3. Clone this repository**

```bash
git clone https://github.com/MartinDelgadoDev/lazynvim.git ~/.config/nvim
```

**4. Start Neovim**

```bash
nvim
```

Lazy.nvim should automatically download and install the configured plugins.

---

### Updating the Configuration

To update this configuration on any machine:

```bash
cd ~/.config/nvim
git pull
```

On Windows PowerShell:

```powershell
cd "$env:LOCALAPPDATA\nvim"
git pull
```

### Useful Commands

Inside Neovim:

| Command | Description |
|---|---|
| `:Lazy` | Open the plugin manager |
| `:Lazy sync` | Install, update, and clean plugins |
| `:Mason` | Manage LSP servers, formatters, and linters |
| `:checkhealth` | Check Neovim configuration and dependencies |

### Notes

- A Nerd Font is recommended for proper icon rendering.
- Some language servers and external tools may need to be installed separately.
- The first launch may take some time while plugins and dependencies are downloaded.
- Back up your existing configuration before installing this repository.

