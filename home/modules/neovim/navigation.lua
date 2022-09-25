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
project.setup {
    detection_methods = {"lsp", "pattern"},
    patterns = {".git", "Makefile", "package.json", ">dev"}
}
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
        H = {"<C-w>H", "Move window left"},
        J = {"<C-w>J", "Move window down"},
        K = {"<C-w>K", "Move window up"},
        L = {"<C-w>L", "Move window right"},
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
    },

    -- buffers 
    b = {
        h = {"<cmd>bp<cr>", "Previous buffer"},
        l = {"<cmd>bn<cr>", "Next buffer"},
        d = {"<cmd>bdelete<cr>", "Delete buffer"}
    },

    -- tabs 
    ["1"] = {"<cmd>1tabn<cr>", "Go to tab 1"},
    ["2"] = {"<cmd>2tabn<cr>", "Go to tab 2"},
    ["3"] = {"<cmd>3tabn<cr>", "Go to tab 3"},
    ["4"] = {"<cmd>4tabn<cr>", "Go to tab 4"},
    ["5"] = {"<cmd>5tabn<cr>", "Go to tab 5"},
    ["6"] = {"<cmd>6tabn<cr>", "Go to tab 6"},
    ["7"] = {"<cmd>7tabn<cr>", "Go to tab 7"},
    ["8"] = {"<cmd>8tabn<cr>", "Go to tab 8"},
    ["9"] = {"<cmd>9tabn<cr>", "Go to tab 9"},
    ["0"] = {"<cmd>10tabn<cr>", "Go to tab 10"},
    ["<Tab>"] = {
        ["<Tab>"] = {"g<Tab>", "Go to previous tab"},
        n = {"<cmd>tabnew<cr>", "New tab"},
        h = {"<cmd>tabp<cr>", "Previous tab"},
        l = {"<cmd>tabn<cr>", "Next tab"},
        H = {"<cmd>-tabmove<cr>", "Move tab left"},
        L = {"<cmd>+tabmove<cr>", "Move tab right"},
        d = {"<cmd>tabclose<cr>", "Close tab"}
    }
}

local opts = {prefix = "<leader>"}

wk.register(mappings, opts)
