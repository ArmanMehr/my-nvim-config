# Neovim configuration

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) to manage plugins.

## Install

Copy or clone this configuration to Neovim's config directory:

- Linux/macOS: `~/.config/nvim`
- Windows: `%LOCALAPPDATA%\nvim` (usually `C:\Users\<you>\AppData\Local\nvim`)

Quick setup from a shell (the destination directory must not already exist):

### Bash

```bash
git clone https://github.com/ArmanMehr/my-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
nvim
```

### zsh (macOS)

```zsh
git clone https://github.com/ArmanMehr/my-nvim-config.git "$HOME/.config/nvim"
nvim
```

### PowerShell

```powershell
git clone https://github.com/ArmanMehr/my-nvim-config.git "$env:LOCALAPPDATA\nvim"
nvim
```

The first launch bootstraps `lazy.nvim` and installs the configured plugins.

## Customize

- Edit `init.lua` for core options, keymaps, and plugin setup.
- Add or change personal plugin specs in `lua/custom/plugins/init.lua`.
- `lazy-lock.json` records the installed plugin revisions.
