local M = {}

function M.setup()
    local hydra = require("hydra")
    local cmd = require('hydra.keymap-util').cmd

    local resetColor = function()
        local winsepConfig = require('config.winsep')
        winsepConfig.resetColor()
    end

    local hint = [[
         _f_: files
    ]]

    hydra({
        name = "shift window",
        config = {
            color = 'teal',
            on_enter = function()
                local winsepConfig = require('config.winsep')
                winsepConfig.updateColor({ guibg = "#5F344F", guifg = "#5F344F" })
            end,
            on_exit = function()
            end,
        },
        mode = 'n',
        body = '<leader>d',
        heads = {
            -- resizing window
            { "h", "<cmd>WinShift left<CR> ", { exit = false, nowait = false } },
            { "j", "<cmd>WinShift down<CR> ", { exit = false, nowait = false } },
            { "k", "<cmd>WinShift up<CR> ", { exit = false, nowait = false } },
            { "l", "<cmd>WinShift right<CR> ", { exit = false, nowait = false } },

            -- exit this Hydra
            { "q", function() resetColor() end, { exit = true, nowait = true } },
            { ";", function() resetColor() end, { exit = true, nowait = true } },
            { "<Esc>", function() resetColor() end, { exit = true, nowait = true } },

        },
    })



    -- some time is not that usefull .....
    hydra({
        name = "move window",
        config = {
            color = 'teal',
            on_enter = function()
                local winsepConfig = require('config.winsep')
                winsepConfig.updateColor({ guibg = "#5F344F", guifg = "#5F344F" })
            end,
            on_exit = function()
                resetColor()
            end,
        },
        mode = 'n',
        body = '<leader>w',
        heads = {
            -- resizing window
            { "h", "<C-w>h", },
            { "l", "<C-w>l", },
            { "k", "<C-w>k", },
            { "j", "<C-w>j", },

            { "s", "<c-w>s", },
            { "v", "<c-w>v", },

            { "H", "<C-w>h", { exit = false, nowait = false } },
            { "L", "<C-w>l", { exit = false, nowait = false } },
            { "K", "<C-w>k", { exit = false, nowait = false } },
            { "J", "<C-w>j", { exit = false, nowait = false } },

            { "S", "<c-w>s", { exit = false, nowait = false } },
            { "V", "<c-w>v", { exit = false, nowait = false } },

            { "e", "<cmd>:q<CR>", { exit = false, nowait = false } },

            -- exit this Hydra
            { "q", function() resetColor() end, { exit = true, nowait = true } },
            { ";", function() resetColor() end, { exit = true, nowait = true } },
            { "<Esc>", function() resetColor() end, { exit = true, nowait = true } },
        },
    })

    hydra({
        name = "resize window",
        --hint = hint,
        config = {
            color = 'teal',
            on_enter = function()
                local winsepConfig = require('config.winsep')
                winsepConfig.updateColor({ guibg = "#6F344F", guifg = "#6F344F" })
            end,
            on_exit = function()
            end,
        },
        mode = 'n',
        body = '<leader>s',
        heads = {
            -- resizing window
            { "h", "<C-w>3<", { exit = false, nowait = false } },
            { "l", "<C-w>3>", { exit = false, nowait = false } },
            { "k", "<C-w>2+", { exit = false, nowait = false } },
            { "j", "<C-w>2-", { exit = false, nowait = false } },


            -- exit this Hydra
            { "q", function() resetColor() end, { exit = true, nowait = true } },
            { ";", function() resetColor() end, { exit = true, nowait = true } },
            { "<Esc>", function() resetColor() end, { exit = true, nowait = true } },
        },
    })
end

return M
