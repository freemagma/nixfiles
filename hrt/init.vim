call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/which-key.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'numtostr/comment.nvim'

Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'ahmedkhalf/project.nvim'

Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'ray-x/cmp-treesitter'

Plug 'l3mon4d3/luasnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

colorscheme gruvbox
set number relativenumber
set clipboard+=unnamedplus

let g:surround_no_mappings = 1
nmap ds       <Plug>Dsurround
nmap cs       <Plug>Csurround
nmap cS       <Plug>CSurround
nmap ys       <Plug>Ysurround
nmap yS       <Plug>YSurround
nmap yss      <Plug>Yssurround
nmap ySs      <Plug>YSsurround
nmap ySS      <Plug>YSsurround
xmap gs       <Plug>VSurround
xmap gS       <Plug>VgSurround


lua << EOF
-- general
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.showmode = false

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- setup various plugins
require("indent_blankline").setup {}
require('nvim-autopairs').setup {}
require('Comment').setup {}

-- which key
local wk = require("which-key")
wk.setup {}

local mappings = {i = {name = "+Misc", h = {":noh<CR>", "Remove highlights"}}}
local opts = {prefix = "<leader>"}

wk.register(mappings, opts)

  local lualine = require("lualine")

lualine.setup {
    sections = {lualine_c = {{'filename', path = 1}}},
    inactive_sections = {lualine_c = {{'filename', path = 1}}}
}

  local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
    ensure_installed = {
        "c", "lua", "bibtex", "cmake", "cpp", "css", "dockerfile", "elixir",
        "html", "javascript", "json", "latex", "lua", "make", "nix", "python",
        "scss", "toml", "typescript", "yaml"
    },
    highlight = { enable = true }
}

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "luasnip"}},
                                 {{name = "buffer"}})
}

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline {},
    sources = cmp.config.sources {{name = "buffer"}}
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline {},
    sources = cmp.config.sources {{name = "cmdline"}, {name = "path"}}
})

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol
                                                          .make_client_capabilities())

local lspconfig = require("lspconfig")

-- python
-- lspconfig.pyright.setup {capabilities = capabilities}

-- lua
-- lspconfig.sumneko_lua.setup {
--     cmd = {"lua-language-server"},
--     settings = {Lua = {diagnostics = {globals = {'vim'}}}},
--     capabilities = capabilities
-- }

-- nix
lspconfig.rnix.setup {capabilities = capabilities}

-- tex
lspconfig.texlab.setup {capabilities = capabilities}

-- EFM
lspconfig.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = "isort --quiet -", formatStdin = true},
                {formatCommand = "black --quiet -", formatStdin = true}
            },
            lua = {{formatCommand = "lua-format -i", formatStdin = true}}
        }
    }
}

-- which key
local wk = require("which-key")

local mappings = {
    -- LSP
    e = {name = "+LSP", f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", "Format"}}
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false
}

wk.register(mappings, opts)

-- tree
local tree = require("nvim-tree")

tree.setup({
    update_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {enable = true, update_cwd = true}
})

-- telescope
local telescope = require("telescope")
telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}
telescope.load_extension("fzf")

-- project
local project = require("project_nvim")
project.setup {detection_methods = {"lsp", "pattern", ">dev"}}
telescope.load_extension("projects")

-- which key
local wk = require("which-key")

local mappings = {
    -- tree
    p = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
    -- search
    s = {
        name = "+Search",
        b = {"<cmd>Telescope buffers<cr>", "Open buffers"},
        c = {"<cmd>Telescope command_history<cr>", "Previous commands"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open recent file"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        p = {"<cmd>Telescope projects<cr>", "Projects"}
    },
    [" "] = {"<cmd>Telescope find_files<cr>", "Find file"},
    -- windows
    w = {
        name = "+Window",
        h = {"<C-w><C-h>", "Move to left window"},
        j = {"<C-w><C-j>", "Move to below window"},
        k = {"<C-w><C-k>", "Move to above window"},
        l = {"<C-w><C-l>", "Move to right window"},
        s = {"<C-w>s", "Split window"},
        v = {"<C-w>v", "Split window vertically"},
        c = {"<C-w>q", "Close window"},
        o = {"<C-w>o", "Keep only current window"},
        t = {"<C-w>T", "Move window to a tab"},
        r = {
            name = "+Resize",
            h = {"<cmd>vertical resize -10<cr>", "Decrease width"},
            j = {"<cmd>resize -10<cr>", "Decrease height"},
            k = {"<cmd>resize +10<cr>", "Increase height"},
            l = {"<cmd>vertical resize +10<cr>", "Increase width"}
        }
    }
}

local opts = {prefix = "<leader>"}

wk.register(mappings, opts)

EOF