local M = {}

function M.load_extensions()
    local telescope = require('telescope')

    -- windows bug here
    --telescope.load_extension('fzf')
end

function M.setup()
    local telescope = require('telescope')
    telescope.setup {
        extensions = {
            fzf = {
                fuzzy = true,   
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",
            },
        },
    }
end
return M
