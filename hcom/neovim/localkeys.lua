local wk = require("which-key")
local jpy = require("lib.jupyter")

vim.cmd("autocmd FileType * lua SetKeybinds()")
function SetKeybinds()
    local file_type = vim.api.nvim_buf_get_option(0, "filetype")
    local nopts = {prefix = "", buffer = 0}
    local vopts = {prefix = "", buffer = 0, mode = "v"}
    local oopts = {prefix = "", buffer = 0, mode = "o"}
    if file_type == "python" then
        wk.register({
            ["<leader>r"] = {
                name = "+Magma",
                ["<CR>"] = {
                    function()
                        jpy.select_cell(0)
                        vim.cmd("normal! gv <cmd>MagmaEvaluateVisual<CR>")
                        jpy.goto_next_cell_start()
                    end, "Magma evaluate cell"
                },
                i = {":MagmaInit<CR>", "Magma init"},
                r = {":MagmaEvaluateLine<CR>", "Magma evaluate line"},
                c = {":MagmaReevaluateCell<CR>", "Magma re-evaluate cell"},
                d = {":MagmaDelete<CR>", "Magma delete"},
                o = {":MagmaShowOutput<CR>", "Magma show output"}
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
            ij = {
                function()
                    jpy.select_cell(0)
                    vim.cmd([[normal! zt]])
                end, "Select cell"
            }
        }, vopts)
        wk.register({
            ij = {
                function()
                    jpy.select_cell(0)
                    vim.cmd([[normal! zt]])
                end, "Select cell"
            }
        }, oopts)
    end
end
