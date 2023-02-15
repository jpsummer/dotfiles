local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
    defaults = {
        mapping = {
            n = {
                ['q'] = actions.close
            }
        }
    },
    extensions = {
        file_browser = {
            theme = 'dropdown',
            -- disables netrw add use telescope-file-browser in its place
            hijack_netrw = true,
            initial_mode = "normal",
            layout_strategy = "vertical",
            layout_config = {
                height = vim.o.lines,
                width = vim.o.columns,
                prompt_position = "top",
                preview_height = 0.6,
            },
            grouped = true,
            hidden = true,
            respect_git_ignore = false,
            mappings = {
                -- custom insert mode mappings
                ['i'] = {
                },
                ['n'] = {
                    ['N'] = fb_actions.create,
                    ['h'] = fb_actions.goto_parent_dir,
                    --['l'] = fb_actions.,
                    ['/'] = function()
                        vim.cmd('startinsert')
                    end
                }
            }
        }
    }
}


telescope.load_extension('file_browser')
telescope.load_extension('harpoon')
