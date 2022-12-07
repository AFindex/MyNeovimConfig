local M ={}


function M.setup()

    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
    vim.opt.listchars:append "space:."

    local indentBlankLine = require("indent_blankline")
    
    indentBlankLine.setup{
        show_end_of_line = true,
        space_char_blankline = " ",
    }
end

return M
