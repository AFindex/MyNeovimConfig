local M = {
    guibg = "#2F348F",
    guifg = "#2F348F"
    --guifg = "#000000"
}

local winsepView = require('colorful-winsep.view')
function M.updateColor(opts)
    M.guibg = opts.guibg
    --M.guifg = opts.guifg
    M.guifg = opts.guifg
    --M.guifg = "#000000"
    M.setup()
    winsepView.highlight()
    --M.setup()
end

function M.resetColor()
    M.guibg = "#2F348F"
    M.guifg = "#2F348F"
    --M.guifg = "#000000"
    M.setup()
    winsepView.highlight()
end

function M.setup()
    local winsep = require('colorful-winsep')
    winsep.setup({

        highlight = {
            guibg = M.guibg,
            guifg = M.guifg,
        },
        -- timer refresh rate
        interval = 30,
        -- This plugin will not be activated for filetype in the following table.
        -- no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest", "NvimTree", "minimap" },
        no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest","minimap" },
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
