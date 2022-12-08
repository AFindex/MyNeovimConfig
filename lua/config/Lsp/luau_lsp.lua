local M ={}

function M.setup()
    local nvimlsp = require('lspconfig')

    local lsp_flags = {
      -- This is the default in Nvim 0.7+ debounce
      debounce_text_changes = 150,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    
    nvimlsp.luau_lsp.setup{
        capabilities = capabilities,
        flags = lsp_flags,
    }


end

return M

