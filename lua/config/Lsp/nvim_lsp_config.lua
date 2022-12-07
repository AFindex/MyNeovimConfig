local M ={}

function M.setup()
    -- local nvimLsp = require('')
    -- C++ clangd 
    require('config.Lsp.clang_lsp').setup()
    require('config.Lsp.nvim_lsp_keymapping').setup()

end

return M

