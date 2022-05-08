local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    ensure_installed = {
        "c", "lua", "bibtex", "cmake", "cpp", "css", "dockerfile", "elixir",
        "html", "javascript", "json", "latex", "lua", "make", "nix", "python",
        "scss", "toml", "typescript", "yaml"
    },
    highlight = { enable = true }
}
