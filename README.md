# maul.nvim

[demo](https://samesense.github.io/maul.nvim/)

> Neovim themes derived from Maul paintings

`maul.nvim` is a Neovim theme plugin built on top of  
[catppuccin/nvim](https://github.com/catppuccin/nvim).

It provides curated color palettes inspired by paintings from Maul and allows **runtime theme switching** via simple Neovim commands.

This plugin does **not** define its own colorscheme. Instead, it dynamically configures Catppuccin using palette and highlight overrides.

---

## Requirements

- Neovim >= 0.8
- [catppuccin/nvim](https://github.com/catppuccin/nvim)

---

## Installation

### lazy.nvim

```lua
{
  "samesense/maul.nvim",
  dependencies = {
    "catppuccin/nvim",
  },
}
```

### packer.nvim

```lua
use {
  "samesense/maul.nvim",
  requires = {
    "catppuccin/nvim",
  },
}
```

### vim-plug

```vim
Plug 'catppuccin/nvim'
Plug 'samesense/maul.nvim'
```

---

## Usage

`maul.nvim` is command-driven. No manual Lua setup is required.

### List available themes

```
:MaulList
```

Prints all registered Maul themes.

---

### Load a theme

```
:MaulLoad maulWall
```

This command:

1. Reconfigures Catppuccin with the selected palette  
2. Applies the appropriate Catppuccin flavour  
3. Reloads the colorscheme immediately  

Tab completion is supported:

```
:MaulLoad <Tab>
```

---

## Available Themes

Each theme corresponds to a palette inspired by a Maul painting:

- maulCircle
- maulCircleDay
- maulWall

All themes currently target the **Catppuccin `mocha` flavour** with custom palette overrides.

---

## How It Works

Each theme entry defines:

- **flavour** -- Catppuccin flavour (`mocha`)  
- **palette** -- Color overrides for that flavour  

When you run:

```
:MaulLoad <theme>
```

The plugin performs:

- `catppuccin.setup()` with theme-specific overrides  
- `:colorscheme catppuccin-mocha`  

No restart is required.

---

## Optional: Load a Theme on Startup

If you want a default Maul theme when Neovim starts:

```lua
vim.cmd("MaulLoad maulWall")
```

Place this after plugin initialization.

---

## File Structure

```
maul.nvim
├── plugin
│   └── maul.lua           # user commands
├── lua
│   └── maul
│       ├── init.lua        # theme loader
│       ├── registry.lua    # theme definitions
│       └── palettes        # palette files
```

---

## License

MIT License -- see LICENSE.

---

## Related Projects

- https://github.com/catppuccin/nvim
- https://github.com/samesense/savitsky.nvim
