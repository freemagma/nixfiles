-- tree
local tree = require("nvim-tree")

tree.setup({
    update_cwd = true,
    update_focused_file = {enable = true, update_cwd = true},
    respect_buf_cwd = true
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
