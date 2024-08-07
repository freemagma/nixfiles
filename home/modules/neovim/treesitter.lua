local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    parser_install_dir = parser_install_dir,
    ensure_installed = {
        "c", "bibtex", "cmake", "cpp", "css", "dockerfile", "elixir",
        "html", "javascript", "json", "latex", "make", "nix", "ocaml",
        "python", "scss", "toml", "typescript", "verilog", "yaml", "zig"
    },
    highlight = {enable = true}
}
