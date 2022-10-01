local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

ls.config.setup({
    enable_autosnippets = true,
    update_events = "TextChangedI",
    region_check_events = "InsertEnter",
    delete_check_events = "TextChanged"
})

ls.add_snippets("tex", {
    postfix({trig = "hht", match_pattern = "[^%s{}\\]+$"}, {
        f(function(_, parent)
            return "\\hat{" .. parent.snippet.env.POSTFIX_MATCH .. "}"
        end, {})
    }), s("beg", {
        t("\\begin{"), i(1), t({"}", ""}), i(2), t({"", ""}),
        f(function(args) return "\\end{" .. args[1][1] .. "}" end, {1})
    }, {
        condition = function(ltc, _, _)
            return string.match(ltc, "^%s*%a*$") ~= nil
        end,
        show_condition = function(ltc)
            return string.match(ltc, "^%s*%a*$") ~= nil
        end
    })
}, {type = "autosnippets", key = "all_auto"})
