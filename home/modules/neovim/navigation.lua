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
local project = require("project")
project.setup {
    patterns = {".git", "Makefile", "package.json", ">dev"}
}
telescope.load_extension("projects")

-- which key
local wk = require("which-key")

wk.add({
    -- tabs
    {"<leader>0", "<cmd>10tabn<cr>", desc = "Go to tab 10"},
    {"<leader>1", "<cmd>1tabn<cr>", desc = "Go to tab 1"},
    {"<leader>2", "<cmd>2tabn<cr>", desc = "Go to tab 2"},
    {"<leader>3", "<cmd>3tabn<cr>", desc = "Go to tab 3"},
    {"<leader>4", "<cmd>4tabn<cr>", desc = "Go to tab 4"},
    {"<leader>5", "<cmd>5tabn<cr>", desc = "Go to tab 5"},
    {"<leader>6", "<cmd>6tabn<cr>", desc = "Go to tab 6"},
    {"<leader>7", "<cmd>7tabn<cr>", desc = "Go to tab 7"},
    {"<leader>8", "<cmd>8tabn<cr>", desc = "Go to tab 8"},
    {"<leader>9", "<cmd>9tabn<cr>", desc = "Go to tab 9"},
    {"<leader><Tab><Tab>", "g<Tab>", desc = "Go to previous tab"},
    {"<leader><Tab>H", "<cmd>-tabmove<cr>", desc = "Move tab left"},
    {"<leader><Tab>L", "<cmd>+tabmove<cr>", desc = "Move tab right"},
    {"<leader><Tab>d", "<cmd>tabclose<cr>", desc = "Close tab"},
    {"<leader><Tab>h", "<cmd>tabp<cr>", desc = "Previous tab"},
    {"<leader><Tab>l", "<cmd>tabn<cr>", desc = "Next tab"},
    {"<leader><Tab>n", "<cmd>tabnew<cr>", desc = "New tab"},
    -- buffers
    {"<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Search buffers"},
    {"<leader>bd", "<cmd>bdelete<cr>", desc = "Delete buffer"},
    {"<leader>bh", "<cmd>bp<cr>", desc = "Previous buffer"},
    {"<leader>bl", "<cmd>bn<cr>", desc = "Next buffer"},
    -- files
    {"<leader>f", group = "File"},
    {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file"},
    {"<leader>p", "<cmd>NvimTreeToggle<cr>", desc = "Explorer"},
    -- search
    {"<leader>s", group = "Search"},
    {"<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Open buffers"},
    {
        "<leader>sc",
        "<cmd>Telescope command_history<cr>",
        desc = "Previous commands"
    },
    {"<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find file"},
    {"<leader>sp", "<cmd>Telescope projects<cr>", desc = "Projects"},
    {"<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open recent file"},
    {"<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text"},
    -- windows
    {"<leader>w", group = "Window"},
    {"<leader>wH", "<C-w>H", desc = "Move window left"},
    {"<leader>wJ", "<C-w>J", desc = "Move window down"},
    {"<leader>wK", "<C-w>K", desc = "Move window up"},
    {"<leader>wL", "<C-w>L", desc = "Move window right"},
    {"<leader>wc", "<C-w>q", desc = "Close window"},
    {"<leader>wh", "<C-w><C-h>", desc = "Move to left window"},
    {"<leader>wj", "<C-w><C-j>", desc = "Move to below window"},
    {"<leader>wk", "<C-w><C-k>", desc = "Move to above window"},
    {"<leader>wl", "<C-w><C-l>", desc = "Move to right window"},
    {"<leader>wo", "<C-w>o", desc = "Keep only current window"},
    -- resize 
    {"<leader>wr", group = "Resize"},
    {"<leader>wrh", "<cmd>vertical resize -10<cr>", desc = "Decrease width"},
    {"<leader>wrj", "<cmd>resize -10<cr>", desc = "Decrease height"},
    {"<leader>wrk", "<cmd>resize +10<cr>", desc = "Increase height"},
    {"<leader>wrl", "<cmd>vertical resize +10<cr>", desc = "Increase width"},
    {"<leader>ws", "<C-w>s", desc = "Split window"},
    {"<leader>wt", "<C-w>T", desc = "Move window to a tab"},
    {"<leader>wv", "<C-w>v", desc = "Split window vertically"}
})

