# 🌊 grugruvbox-material.nvim
![screen](/media/logo.jpg)

## 🔱 Info
A port or [Material](https://material-theme.site) colorscheme for NeoVim written in Lua

Material.nvim is meant to be a fast and modern colorscheme written in Lua that supports a lot of the new features
added to NeoVim like built-in LSP and [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)

If you want the old version that uses colorbuddy.nvim, you can find it [here](https://github.com/marko-cerovac/material.nvim/tree/colorbuddy)

## ✨ Features

+ 5 styles to choose from
    + Darker ![screen](/media/darker.png)

+ Supported plugins:
    + [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
    + [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
    + [Lsp Saga](https://github.com/glepnir/lspsaga.nvim)
    + [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
    + [Git Gutter](https://github.com/airblade/vim-gitgutter)
    + [git-messenger](https://github.com/rhysd/git-messenger.vim)
    + [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
    + [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    + [Nvim-Tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
    + [NERDTree](https://github.com/preservim/nerdtree)
    + [vim-which-key](https://github.com/liuchengxu/vim-which-key)
    + [Indent-Blankline.nvim](https://github.com/lukas-reineke/indenhttps://github.com/liuchengxu/vim-which-keyt-blankline.nvim)
    + [WhichKey](https://github.com/liuchengxu/vim-which-key)
    + [WhichKey.nvim](https://github.com/folke/which-key.nvim)
    + [Dashboard](https://github.com/glepnir/dashboard-nvim)
    + [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
    + [Lualine](https://github.com/hoob3rt/lualine.nvim)
    + [Neogit](https://github.com/TimUntersberger/neogit)
    + [vim-sneak](https://github.com/justinmk/vim-sneak)
    + [nvim-dap](https://github.com/mfussenegger/nvim-dap)

+ Ability to change background on sidebar-like windows like Nvim-Tree, Packer, terminal etc.

+ Asynchronous highlight loading which makes the theme extremely fast

+ Added functions for live theme switching without the need to restart NeoVim

## ⚡️ Requirements

+ Neovim >= 0.5.0

## ⚓ Installation

Install via your favourite package manager:
```vim
" If you are using Vim-Plug
Plug ''
```

```lua
-- If you are using Packer
use ''
```

## 🐬 Usage

Enable the colorscheme:
```vim
"Vim-Script:
colorscheme gruvbox-material.nvim
```

```lua
--Lua:
require('gruvbox-material').set()
```

To enable the `material-nvim` theme for `Lualine`, simply specify it in your lualine settings:
( make sure to set the theme to 'material-nvim', as 'material' already exists built in to lualine)

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'gruvbox-material.nvim'
    -- ... your lualine config
  }
}
```

## ⚙️ Configuration

+ There are 5 different styles available:
    + deep ocean

Set the desired style using:
```vim
"Vim-Script:
let g:material_style = 'darker'
```

| Option                              | Default     | Description                                                                                      |
| ----------------------------------- | ----------- | ------------------------------------------------------------------------------------------------ |
| material_style                      | `"oceanic"` | The theme comes in five styles, 'darker', 'lighter', 'palenight', 'oceanic' and 'deep ocean'     |
| material_contrast                   | `true`      | Make sidebars and popup menus like nvim-tree and telescope have a different background           |
| material_lighter_contrast           | `false`     | Increase the contrast for the 'lighter' variant of the theme                                     |
| material_italic_comments            | `false`     | Make comments italic                                                                             |
| material_italic_keywords            | `false`     | Make keywords like if, for, while etc. italic                                                    |
| material_italic_functions           | `false`     | Make function calls and names italic                                                             |
| material_italic_variables           | `false`     | Make variable names and identifiers italic                                                       |
| material_borders                    | `false`     | Enable the border between verticaly split windows visable                                        |
| material_disable_background         | `false`     | Disable the setting of background color so that NeoVim can use your terminal background          |
| material_variable_color             | `#717CB4`   | Set a custom color for variables and fields                                                      |
| material_custom_colors              |    {}       | Override the default colors and use your own                                                     |

```lua
-- Example config in lua
vim.g.material_style = 'deep ocean'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false
--vim.g.material_custom_colors = { black = "#000000", bg = "#0F111A" }

-- Load the colorscheme
require('material').set()
```

```vim
" Example config in Vim-Script
let g:material_style = 'deep ocean'
let g:material_italic_comments = 1
let g:material_italic_keywords = 1
let g:material_italic_functions = 1
let g:material_contrast = 1

" Load the colorsheme
colorscheme material
```

## ⛵ Functions

+ Toggle the style live without the need to exit NeoVim

![screen](/media/toggle_style.gif)

Just call the function for style switching
```vim
"Vim-Script
:lua require('material.functions').toggle_style()
"This command toggles the style
```

The command can also be mapped to a key for fast style switching
```vim
"Vim-Script:
nnoremap <C-m> :lua require('material.functions').toggle_style()<CR>
```

```lua
--Lua:
vim.api.nvim_set_keymap('n', '<C-m>', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
```


+ Change the style to a desired one using the function change_style("desired style")
```vim
"Vim-Script:
:lua require('material.functions').change_style("palenight")
"This command changes the style to palenight
```

The command can also be mapped to a key for fast style switching
```vim
"Vim-Script:
nnoremap <C-9> :lua require('material.functions').change_style('lighter')<CR>
nnoremap <C-0> :lua require('material.functions').change_style('darker')<CR>
```

```lua
--Lua:
vim.api.nvim_set_keymap('n', '<C-9>', [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-0>', [[<Cmd>lua require('material.functions').change_style('darker')<CR>]], { noremap = true, silent = true })
```
