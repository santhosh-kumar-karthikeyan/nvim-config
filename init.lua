vim.g.mapleader = " "
require("config.lazy")
require("plugins.catppuccin")
require("plugins.treesitter")
require("plugins.markdown")
local tsConfig = require("nvim-treesitter.configs")
tsConfig.setup({
	ensure_installed = {"lua","c","cpp","markdown","javascript","python"},
	highlight = { enable = true },
	indent = { enable = true }
})
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
vim.cmd.colorscheme "catppuccin"
