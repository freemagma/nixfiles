-- catppuccin
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]

-- lualine
local lualine = require("lualine")

lualine.setup {
    options = {theme = "catppuccin", ignore_focus = {"NvimTree"}},
    sections = {lualine_c = {{'filename', path = 1}}},
    inactive_sections = {lualine_c = {{'filename', path = 1}}}
}

-- bufferline
local bufferline = require("bufferline")

bufferline.setup {
    options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'center'
            }
        }
    }
}

-- scope 
require("scope").setup {}
