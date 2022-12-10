local M ={}

function M.setup()
    local nvimlsp = require('lspconfig')

    local lsp_flags = {
      debounce_text_changes = 150,
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }

    
    nvimlsp.sumneko_lua.setup{
        capabilities = capabilities,
        flags = lsp_flags,
        settings = {
            Lua = {
                runtime = {
                  version = 'LuaJIT',
                },
                diagnostics = {
                  globals = {'vim'},
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                  enable = false,
                },            
            },
        },
    }


end

return M
