vim.g.mapleader = " "
require("config.lazy")
require("plugins.catppuccin")
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
vim.cmd.colorscheme "catppuccin"
