local wk = require("which-key")
local jpy = require("lib.jupyter")

vim.cmd("autocmd FileType * lua SetKeybinds()")
function SetKeybinds()
    local file_type = vim.bo.filetype
    -- jupyter python
    if file_type == "python" and vim.fn.getline(2):match("^# jupyter:") then
        wk.add({
            buffer = 0,
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
