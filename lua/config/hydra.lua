local M = {}

function M.setup()
    local hydra = require("hydra")
    local cmd = require('hydra.keymap-util').cmd

    local hint = [[
         _f_: files
    ]]

    hydra({
        name = "shift window",
        config = {
            color = 'teal',
        },
        mode = 'n',
        body = '<leader>S',
       heads = {
            -- resizing window
            { "h", "<cmd>WinShift left<CR> ", { exit = false, nowait = false } },
            { "j", "<cmd>WinShift down<CR> ", { exit = false, nowait = false } },
            { "k", "<cmd>WinShift up<CR> ", { exit = false, nowait = false } },
            { "l", "<cmd>WinShift right<CR> ", { exit = false, nowait = false } },

            -- exit this Hydra
            { "q", nil, { exit = true, nowait = true } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },

        },
    })

    hydra({
        name = "move window",
        config = {
            color = 'teal',
        },
        mode = 'n',
        body = '<leader>w',
        heads = {
            -- resizing window
            { "h", "<C-w>h", { exit = false, nowait = false } },
            { "l", "<C-w>l", { exit = false, nowait = false } },
            { "k", "<C-w>k", { exit = false, nowait = false } },
            { "j", "<C-w>j", { exit = false, nowait = false } },


            {"s", "<c-w>s",{ exit = false, nowait = false }},
            {"v", "<c-w>v",{ exit = false, nowait = false }},

            {"e", "<cmd>:wq<CR>",{ exit = false, nowait = false }},

            -- exit this Hydra
            { "q", nil, { exit = true, nowait = true } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
        },
    })

    hydra({
        name = "resize window",
        --hint = hint,
        config = {
            color = 'teal',
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
            { "q", nil, { exit = true, nowait = true } },
            { ";", nil, { exit = true, nowait = true } },
            { "<Esc>", nil, { exit = true, nowait = true } },
        },
    })
end

return M
