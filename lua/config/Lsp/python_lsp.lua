local M = {}

function M.setup()
    local nimlsp = require("lspconfig")
    local lsp_flags = {
        debounce_text_changes = 150,
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = true,
        lineFoldingOnly = true,
    }

    nimlsp.pyright.setup({
        capabilities = capabilities,
    })
end

return M
