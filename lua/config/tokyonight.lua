local M = {}
function M.setup()
    local tokyonight = require("tokyonight")

    local conf = {
        style = "storm",
        styles = {
          functions = {}
        },

        terminal_colors = true,
        dim_inactive = true,
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
        end
    }

    tokyonight.setup(conf)

    vim.cmd[[ colorscheme tokyonight ]]

end

return M
