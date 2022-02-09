-- general
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.showmode = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- which key
local wk = require("which-key")
wk.setup {}

local mappings = {i = {name = "+Misc", h = {":noh<CR>", "Remove highlights"}}}
local opts = {prefix = "<leader>"}

wk.register(mappings, opts)
