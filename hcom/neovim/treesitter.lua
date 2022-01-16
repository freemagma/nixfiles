local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  ensure_installed = { "python" },
  highlight = {
    enable = true
  }
}
