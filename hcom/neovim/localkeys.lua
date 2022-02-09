local wk = require("which-key")

vim.cmd('autocmd FileType * lua SetKeybinds()')
function SetKeybinds()
    local file_type = vim.api.nvim_buf_get_option(0, "filetype")
    local nopts = {prefix = '<leader>', buffer = 0}
    local vopts = {prefix = '<leader>', buffer = 0, mode = "v"}
    if file_type == 'python' then
        wk.register({
            r = {
                name = "+Magma",
                i = {':MagmaInit<CR>', 'Magma init'},
                r = {':MagmaEvaluateLine<CR>', 'Magma evaluate line'},
                c = {':MagmaReevaluateCell<CR>', 'Magma reevaluate cell'},
                d = {':MagmaDelete<CR>', 'Magma delete'},
                o = {':MagmaShowOutput<CR>', 'Magma show output'}
            }
        }, nopts)
        wk.register({
            r = {':<C-u>MagmaEvaluateVisual<CR>', 'Magma evaluate visual'}
        }, vopts)
    end
end
