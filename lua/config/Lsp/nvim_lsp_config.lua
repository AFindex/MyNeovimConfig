local M ={}

function M.setup()
    -- local nvimLsp = require('')
    --luau_lsp
    --python_lsp
    require('config.Lsp.bashls_lsp').setup()
    require('config.Lsp.python_lsp').setup()
    require('config.Lsp.luau_lsp').setup()
    require('config.Lsp.sumneko_lua').setup()
    -- C++ clangd 
    require('config.Lsp.clang_lsp').setup()
    require('config.Lsp.nvim_lsp_keymapping').setup()

end

return M

