local M ={}


function M.setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    local language_servers = {} -- like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
            capabilities = capabilities,
        })
    end
    require('ufo').setup()

    -- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    -- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

return M
