# Neovim Setup Guide for New Machines

This guide walks you through setting up this Neovim configuration on a fresh macOS machine. The configuration uses **lazy.nvim** for plugin management, **Mason** for LSP servers, and automatically installs most dependencies.

## Prerequisites

### 1. Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Core Dependencies
```bash
# Neovim and essential tools
brew install neovim tree-sitter git  # tree-sitter CLI required for :TSUpdate, :TSInstallInfo, etc.

# Language runtimes (for LSP servers)
brew install node python go
```

### 3. Install Global Language Tools (Optional but Recommended)
```bash
# TypeScript/JavaScript support
npm install -g typescript typescript-language-server

# Python virtual environment (optional)
python3 -m venv ~/.venv/nvim
```

## Configuration Setup

### Option A: Clone Existing Configuration
If you have this configuration in a Git repository:
```bash
git clone <your-repo-url> ~/.config/nvim
```

### Option B: Copy from Existing Machine
```bash
# Copy the configuration folder
scp -r user@existing-machine:~/.config/nvim ~/.config/
```

## First Run & Auto-Installation

When you first run Neovim, several automatic processes will start:

### 1. **lazy.nvim Installation**
- lazy.nvim will clone itself to `~/.local/share/nvim/lazy/lazy.nvim`
- This happens automatically on first run

### 2. **Plugin Installation**
All plugins defined in `lua/josemicode/plugins/` will be installed:
- File navigation: Telescope, Harpoon, Oil.nvim
- Editing: Treesitter, Commentary, nvim-surround, Leap
- Git: Fugitive, Diffview
- LSP: nvim-lspconfig, Mason, blink.cmp
- UI: Rose-pine theme, snacks.nvim

### 3. **Mason LSP Server Installation**
Mason will automatically install these language servers:
- `pyright` - Python
- `html` - HTML
- `ts_ls` - TypeScript/JavaScript
- `gopls` - Go

### First Run Commands
```bash
# Start Neovim (plugins will install automatically)
nvim

# OR force installation without opening UI
nvim --headless +"Lazy sync" +qa
```

## Manual Installation Commands

If auto-installation doesn't work, run these manually:

```bash
# Install all plugins
nvim --headless +"Lazy sync" +qa

# Install Mason LSP servers
nvim --headless +"MasonInstallAll" +qa

# Install treesitter parsers
nvim --headless +"TSUpdateSync" +qa
```

## Verification Steps

After installation, verify everything works:

### 1. Check Plugin Installation
```vim
:Lazy
```

### 2. Check LSP Servers
```vim
:Mason          " Should show installed servers
:LspInfo        " Should show active LSP clients
```

### 3. Check Treesitter
```vim
:TSInstallInfo  " Should show installed parsers
:checkhealth    " Comprehensive health check
```

### 4. Test Key Features
- `<leader>pv` - Open Oil file explorer
- `<leader>pf` - Telescope file search
- `gcc` - Comment a line
- `gd` - Go to definition (when LSP is active)
- `s` - Leap to a visible word

## Language-Specific Setup

### Python
```bash
# Ensure Python is available
python3 --version

# Install pyright via Mason (automatic)
# Or manually: pip install pyright
```

### Go
```bash
# Ensure Go is available
go version

# Install gopls via Mason (automatic)
# Or manually: go install golang.org/x/tools/gopls@latest
```

### TypeScript/JavaScript
```bash
# Ensure Node.js is available
node --version

# TypeScript language server will be installed by Mason
```

## Troubleshooting

### Common Issues

#### 1. "Lazy.nvim not installed"
**Solution**: Restart Neovim. lazy.nvim should auto-install on first run.

#### 2. "LSP servers not working"
**Solution**:
```vim
:MasonInstallAll   " Install all configured servers
:LspRestart        " Restart LSP clients
```

#### 3. "Treesitter highlighting not working"
**Solution**:
```vim
:TSUpdate         # Update all parsers
:TSInstall <lang> # Install specific language parser
```

#### 4. "Keybindings not working"
**Solution**: Check keymaps:
```vim
:map <leader>     # Show leader keymaps
:verbose map      # Show all keymaps with source
```

#### 5. "Completion not working"
**Solution**: blink.cmp uses **manual trigger** by default. Try:
- `Ctrl-Space` or `Tab` in insert mode
- Check `:map i` for insert mode mappings

### Health Check
Run comprehensive diagnostics:
```vim
:checkhealth
```
This checks:
- Neovim version
- Plugin manager
- LSP capabilities
- Treesitter
- Clipboard integration

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/josemicode/
│   ├── init.lua               # Core settings
│   ├── lazy.lua               # lazy.nvim setup
│   ├── remap.lua              # Key mappings
│   └── plugins/               # Plugin definitions
│       ├── editor.lua         # Editing plugins
│       ├── git.lua            # Git plugins
│       ├── lsp.lua            # LSP & completion
│       └── ui.lua             # UI & themes
├── KEYBINDS.md                # Keybind reference (generated)
└── SETUP.md                   # This file
```

## Quick Start Reference

### One-Line Setup (if prerequisites met)
```bash
# Clone config and let auto-install do the work
git clone <repo> ~/.config/nvim && nvim --headless +"Lazy sync" +qa && nvim
```

### Essential Commands to Remember
```bash
# Update everything
nvim --headless +"Lazy sync" +qa

# Install specific language server
nvim --headless +"MasonInstall pyright" +qa

# Update treesitter parsers
nvim --headless +"TSUpdateSync" +qa
```

### Inside Neovim
```vim
:Lazy sync      # Update plugins
:Mason          # Manage LSP servers
:TSUpdate       # Update treesitter parsers
:LspInfo        # Check LSP status
:checkhealth    # System health check
```

## Post-Setup Customization

### Add More LSP Servers
Edit `lua/josemicode/plugins/lsp.lua`:
```lua
local servers = { "pyright", "html", "ts_ls", "gopls", "rust_analyzer", "clangd" }
```

### Add Treesitter Parsers
Edit `lua/josemicode/plugins/editor.lua`:
```lua
ensure_installed = { "lua", "python", "go", "javascript", "typescript", "rust", "cpp" }
```

### Change Color Scheme
Edit `lua/josemicode/plugins/ui.lua`:
```lua
require("rose-pine").setup({ variant = "dawn" })  # or "main", "moon"
```

## Support

If issues persist:
1. Check `:messages` for error logs
2. Run `:checkhealth` for diagnostics
3. Consult `KEYBINDS.md` for keybinding reference
4. Verify all prerequisites are installed

---

**Last Updated**: lazy.nvim configuration  
**Auto-Install Features**: Plugins, LSP servers, Treesitter parsers  
**Theme**: Rose-pine (moon variant)  
**Completion**: blink.cmp with manual trigger