-- general
vim.g.mapleader = " "
vim.o.showmode = false

-- visual
local lualine = require("lualine")
lualine.setup { }

-- treesitter
local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  ensure_installed = { "python" },
  highlight = {
    enable = true
  }
}

-- completion
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, {"i", "s"}
        ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, {"i", "s"}
        ),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }, {
      { name = "buffer" },
    })
}

cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})

cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP
local lspconfig = require("lspconfig")
lspconfig.pyright.setup { capabilities = capabilities }

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

-- which key
wk = require("which-key")
wk.setup {}

local mappings = {
    s = {
        name = "+Search",
        b = {"<cmd>Telescope buffers<cr>", "Open Buffers"},
        c = {"<cmd>Telescope command_history<cr>", "Previous commands"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
    }
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
