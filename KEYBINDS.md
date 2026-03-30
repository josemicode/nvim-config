# Neovim Keybind Reference

## Leader Key
- **Leader**: `Space` (pressed and released)

## Table of Contents
- [Global Keybinds](#global-keybinds)
- [File & Navigation](#file--navigation)
- [Editing & Text Objects](#editing--text-objects)
- [Git Operations](#git-operations)
- [LSP & Completion](#lsp--completion)
- [Diagnostics](#diagnostics)
- [Plugins](#plugins)
- [Tips & Notes](#tips--notes)

---

## Global Keybinds

| Keybind | Action | Mode |
|---------|--------|------|
| `<A-j>` | Move line down | Normal |
| `<A-k>` | Move line up | Normal |
| `gcc` | Toggle line comment | Normal |
| `gd` | Go to definition (LSP) | Normal |
| `gi` | Go to implementation (LSP) | Normal |
| `gr` | Find references (LSP) | Normal |
| `gt` | Go to type definition (LSP) | Normal |
| `K` | Show hover documentation (LSP) | Normal |
| `[d` | Go to previous diagnostic | Normal |
| `]d` | Go to next diagnostic | Normal |
| `s` | Leap forward to target | Normal |
| `S` | Leap backward to target | Normal |
| `gs` | Leap from anywhere | Normal |

## File & Navigation

| Keybind | Action | Plugin |
|---------|--------|--------|
| `<leader>pv` | Open Oil file explorer | Oil.nvim |
| `<leader>pf` | Find files (Telescope) | Telescope |
| `<C-p>` | Git files (Telescope) | Telescope |
| `<leader>ps` | Live grep (Telescope) | Telescope |
| `<leader>a` | Add file to Harpoon | Harpoon |
| `<C-e>` | Toggle Harpoon menu | Harpoon |

## Editing & Text Objects

### Commentary
| Keybind | Action | Mode |
|---------|--------|------|
| `gcc` | Toggle line comment | Normal |
| `gc` | Comment selection | Visual |

### nvim-surround
| Keybind | Action | Mode |
|---------|--------|------|
| `ys{motion}{char}` | Add surrounding around motion | Normal |
| `yss{char}` | Surround entire line | Normal |
| `yS{motion}{char}` | Add surrounding with newline | Normal |
| `ySS{char}` | Surround line with newline | Normal |
| `ds{char}` | Delete surrounding | Normal |
| `cs{old}{new}` | Change surrounding | Normal |
| `S{char}` | Surround selection | Visual |
| `<C-g>s{char}` | Add surrounding in insert mode | Insert |
| `<C-g>S{char}` | Add surrounding with newline | Insert |

### Leap.nvim
| Keybind | Action |
|---------|--------|
| `s` | Leap forward to target |
| `S` | Leap backward to target |
| `gs` | Leap from anywhere (cross-window) |

## Git Operations

| Keybind | Action | Plugin |
|---------|--------|--------|
| `<leader>gd` | Open Git diff view | Diffview |
| `<leader>gh` | File history (current file) | Diffview |
| `:G` / `:Git` | Fugitive commands | Fugitive |

## LSP & Completion

### Language Server Protocol
| Keybind | Action |
|---------|--------|
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `gt` | Go to type definition |
| `K` | Show hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>lf` | Format buffer (async) |
| `<C-k>` | Signature help (insert mode) |
| `<leader>ls` | Document symbols |
| `<leader>lw` | Workspace symbols |

### Mason (LSP Manager)
| Keybind | Action |
|---------|--------|
| `<leader>lm` | Open Mason UI |

### blink.cmp (Completion)
*Autocomplete is disabled - manual trigger only*
- **Preset**: `default`
- **Navigation**: `Ctrl-n` / `Ctrl-p` (likely)
- **Confirm**: `Ctrl-y` or `Enter` (likely)
- **Manual trigger**: `Ctrl-Space` or `Tab` (check with `:map`)

## Diagnostics

| Keybind | Action |
|---------|--------|
| `[d` | Go to previous diagnostic |
| `]d` | Go to next diagnostic |
| `<leader>q` | Set location list |
| `<leader>ld` | Open diagnostic in float window |
| `<leader>lc` | Open quickfix list with diagnostics |

## Plugins

### Undotree
- `:UndotreeToggle` - Toggle undo tree visualization

### Treesitter
- `:TSUpdate` - Update treesitter parsers
- `:TSInstallInfo` - Show installed parsers

### Oil.nvim
- `:Oil` - Open file explorer
- Navigation works like netrw within Oil buffer

### Harpoon
- `:Harpoon` commands available
- UI shows number shortcuts for quick navigation

## Tips & Notes

### 1. Leader Key Patterns
- `<leader>p` - Project/search operations (Telescope)
- `<leader>l` - LSP operations
- `<leader>g` - Git operations

### 2. LSP Server Setup
Mason automatically installs these language servers:
- `pyright` - Python
- `html` - HTML
- `ts_ls` - TypeScript/JavaScript
- `gopls` - Go

### 3. Treesitter Auto-installation
Parsers automatically install when opening new file types. Pre-installed:
- lua, python, go, javascript, typescript, html, css, json, yaml, bash, markdown

### 4. Checking Active Keymaps
```vim
:map          " Show all keymaps
:map <leader> " Show leader keymaps
:verbose map  " Show keymaps with where they were set
```

### 5. Customization
Keymaps are defined in:
- `lua/josemicode/remap.lua` - Global remappings
- `lua/josemicode/plugins/` - Plugin-specific keymaps

### 6. Diagnostic Symbols
- `■` Error
- `▲` Warning  
- `◆` Information
- `▸` Hint

---

**Last Updated**: Configuration as of lazy.nvim migration  
**Theme**: Rose-pine (moon variant)  
**Completion**: blink.cmp with manual trigger  
**File Explorer**: Oil.nvim with hidden files shown