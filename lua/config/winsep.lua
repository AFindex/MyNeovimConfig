local M = {}
function M.setup()
    require('colorful-winsep').setup({
        -- highlight for Window separator
        highlight = {
            guibg = "#5F344F",
            guifg = "#5F344F",
        },
        -- timer refresh rate
        interval = 30,
        -- This plugin will not be activated for filetype in the following table.
        no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "minimap" },
        -- Symbols for separator lines, the order: horizontal, vertical, top left, top right, bottom left, bottom right.
        symbols = { "─", "│", "┌", "┐", "└", "┘" },
        close_event = function()
            -- Executed after closing the window separator
        end,
        create_event = function()
            -- Executed after creating the window separator
        end,
    })
end

return M
