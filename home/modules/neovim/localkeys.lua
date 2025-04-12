local wk = require("which-key")
local jpy = require("lib.jupyter")

vim.cmd("autocmd FileType * lua SetKeybinds()")
function SetKeybinds()
    local file_type = vim.api.nvim_buf_get_option(0, "filetype")
    -- jupyter python
    if file_type == "python" and vim.fn.getline(2):match("^# jupyter:") then
        wk.add({
            buffer = 0,
            {
                "<CR>",
                function()
                    jpy.goto_next_cell_start()
                    jpy.select_cell(0)
                    vim.cmd([[normal! zt]])
                    -- kinda hacky, but...
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<leader>r", true, false,
                                                       true), "m", true)
                end,
                desc = "Magma evaluate cell"
            },
            {"<localleader>r", group = "Magma"},
            {"<localleader>ri", ":MagmaInit<CR>", desc = "Magma init"},
            -- {"<localleader>rr", ":MagmaEvaluateLine<CR>", desc = "Magma evaluate line"},
            {
                "<localleader>rr",
                ":MagmaReevaluateCell<CR>",
                desc = "Magma re-evaluate cell"
            },
            {"<localleader>rd", ":MagmaDelete<CR>", desc = "Magma delete"},
            {
                "<localleader>ro",
                ":MagmaShowOutput<CR>",
                desc = "Magma show output"
            },
            {
                "<localleader>rh",
                ":MagmaHideOutput<CR>",
                desc = "Magma hide output"
            },
            {
                "[j",
                function() jpy.goto_previous_cell_start() end,
                desc = "Previous cell start"
            },
            {
                "[J",
                function() jpy.goto_previous_cell_end() end,
                desc = "Previous cell end"
            },
            {
                "]j",
                function() jpy.goto_next_cell_start() end,
                desc = "Previous cell start"
            },
            {
                "]J",
                function() jpy.goto_next_cell_end() end,
                desc = "Previous cell end"
            },
            {
                mode = "v",
                {
                    "<localleader>r",
                    ":<C-u>MagmaEvaluateVisual<CR>",
                    desc = "Magma evaluate visual"

                },
                {"ij", function() jpy.select_cell(0) end, desc = "Select cell"}

            },
            {
                mode = "o",
                {"ij", function() jpy.select_cell(0) end, desc = "Select cell"}

            }
        })

        -- tex
    elseif file_type == "tex" then
        wk.add({
            {"<localleader>eb", "<cmd>TexlabBuild<cr>", desc = "TeX build"},
            {
                "<localleader>ev",
                "<cmd>TexlabForward<cr>",
                desc = "TeX forward search"
            }
        })
    end
end
