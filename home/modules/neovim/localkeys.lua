local wk = require("which-key")
local jpy = require("lib.jupyter")

vim.cmd("autocmd FileType * lua SetKeybinds()")
function SetKeybinds()
    local file_type = vim.api.nvim_buf_get_option(0, "filetype")
    local nopts = {prefix = "", buffer = 0}
    local vopts = {prefix = "", buffer = 0, mode = "v"}
    local oopts = {prefix = "", buffer = 0, mode = "o"}
    -- jupyter python
    if file_type == "python" and vim.fn.getline(2):match("^# jupyter:") then
        wk.register({
            ["<CR>"] = {
                function()
                    jpy.goto_next_cell_start()
                    jpy.select_cell(0)
                    vim.cmd([[normal! zt]])
                    -- kinda hacky, but...
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<leader>r", true, false,
                                                       true), "m", true)
                end, "Magma evaluate cell"
            },
            ["<leader>r"] = {
                name = "+Magma",
                i = {":MagmaInit<CR>", "Magma init"},
                -- r = {":MagmaEvaluateLine<CR>", "Magma evaluate line"},
                r = {":MagmaReevaluateCell<CR>", "Magma re-evaluate cell"},
                d = {":MagmaDelete<CR>", "Magma delete"},
                o = {":MagmaShowOutput<CR>", "Magma show output"},
                h = {":MagmaHideOutput<CR>", "Magma hide output"}
            },
            ["[j"] = {
                function() jpy.goto_previous_cell_start() end,
                "Previous cell start"
            },
            ["[J"] = {
                function() jpy.goto_previous_cell_end() end, "Previous cell end"
            },
            ["]j"] = {
                function() jpy.goto_next_cell_start() end, "Previous cell start"
            },
            ["]J"] = {
                function() jpy.goto_next_cell_end() end, "Previous cell end"
            }

        }, nopts)
        wk.register({
            ["<leader>r"] = {
                ":<C-u>MagmaEvaluateVisual<CR>", "Magma evaluate visual"
            },
            ij = {function() jpy.select_cell(0) end, "Select cell"}
        }, vopts)
        wk.register({ij = {function() jpy.select_cell(0) end, "Select cell"}},
                    oopts)
        -- tex
    elseif file_type == "tex" then
        wk.register({
            ["<leader>eb"] = {"<cmd>TexlabBuild<cr>", "TeX build"},
            ["<leader>ev"] = {"<cmd>TexlabForward<cr>", "TeX forward search"}
        }, nopts)
    end
end
