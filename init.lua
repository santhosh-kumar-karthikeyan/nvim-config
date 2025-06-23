vim.g.mapleader = " "
require("config.lazy")
require("plugins.catppuccin")
require("plugins.treesitter")
require("plugins.markdown")
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
-- Enable filetype-specific indentation
vim.cmd("filetype plugin indent on")

-- Global indentation settings
vim.o.expandtab = true        -- Use spaces instead of tabs
vim.o.shiftwidth = 4          -- Number of spaces for each indentation level
vim.o.softtabstop = 4         -- Number of spaces when pressing Tab in insert mode
vim.o.tabstop = 4             -- Number of spaces that a <Tab> in the file counts for
vim.o.smartindent = true      -- Smart autoindent for C-like languages
vim.o.autoindent = true       -- Copy indent from current line when starting new one

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }
local tsConfig = require("nvim-treesitter.configs")
tsConfig.setup({
	ensure_installed = {"lua","c","cpp","markdown","javascript","python"},
	highlight = { enable = true },
})
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>', builtin.find_files, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
vim.cmd.colorscheme "catppuccin"
