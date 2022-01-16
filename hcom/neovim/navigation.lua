-- tree
vim.g.nvim_tree_respect_buf_cwd = 1

local tree = require("nvim-tree")

tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
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
  detection_methods = {"lsp", "pattern", ">dev"}
}
telescope.load_extension("projects")

-- which key
wk = require("which-key")

local mappings = {
    e = {"<cmd>NvimTreeToggle<cr>", "Explorer"},
    s = {
        name = "+Search",
        b = {"<cmd>Telescope buffers<cr>", "Open Buffers"},
        c = {"<cmd>Telescope command_history<cr>", "Previous commands"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        p = {"<cmd>Telescope projects<cr>", "Projects"},
    },
}

local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false
}

wk.register(mappings, opts)
