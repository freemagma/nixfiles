local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    ensure_installed = "maintained",
    ignore_install = {"lua", "latex"},
    highlight = {enable = true}
}
