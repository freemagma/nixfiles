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
