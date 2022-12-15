local M ={}

function M.setup()

    local nvimlsp = require('lspconfig')

    local lsp_flags = {
      -- This is the default in Nvim 0.7+
      debounce_text_changes = 150,
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }


    nvimlsp.bashls.setup{
        capabilities = capabilities,
        flags = lsp_flags,
    }
end

return M

