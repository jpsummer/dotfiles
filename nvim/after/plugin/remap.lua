local remap = require("jpsummer.keymap")
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
local inoremap = remap.inoremap
local xnoremap = remap.xnoremap
local nmap = remap.nmap


local silent = { silent = true }

-- File Browser
nnoremap("<leader>ls",
    '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, initial_mode = "normal", layout_strategy = "vertical", layout_config = { height = vim.o.lines, width = vim.o.columns, prompt_position = "top", preview_height = 0.6 } })<cr>'
    , silent
)

-- Fuzzy Finder
nnoremap("<leader>;f",
    '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<cr>',
    silent
)

-- Live Grep
nnoremap("<leader>;r",
    '<cmd>lua require("telescope.builtin").live_grep()<cr>',
    silent
)

-- BufferLine Next/Prev Tab
nnoremap("<leader><Tab>",
    '<cmd>BufferLineCycleNext<cr>', silent
)
nnoremap("<leader><S-Tab>",
    '<cmd>BufferLineCyclePrev<cr>', silent
)

-- Harpoon
nnoremap("<C-f>", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-m>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-q>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-w>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-r>", function() require("harpoon.ui").nav_file(4) end, silent)
