-- catppuccin
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]

-- lualine
local lualine = require("lualine")

lualine.setup {
    options = {theme = "catppuccin"},
    sections = {lualine_c = {{'filename', path = 1}}},
    inactive_sections = {lualine_c = {{'filename', path = 1}}}
}
