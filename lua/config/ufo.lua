local M = {}

local function selectProviderWithChainByDefault()
    local ftMap = {
        vim = { "lsp","indent", },
        python = { "lsp","indent", },
        git = { "indent", },

        cpp = { "lsp","indent", },
        c = { "lsp","indent", },

    }

    ---@param bufnr number
    ---@return Promise
    local function customizeSelector(bufnr)
        local function handleFallbackException(err, providerName)
            if type(err) == 'string' and err:match('UfoFallbackException') then
                return require('ufo').getFolds(bufnr, providerName)
            else
                return require('promise').reject(err)
            end
        end

        return require('ufo').getFolds(bufnr, 'lsp'):catch(function(err)
            -- local vlog = require('vlog')
            -- vlog.info('lsp provider failed, fallback to treesitter provider')
            --return handleFallbackException(err, 'treesitter')
        end):catch(function(err)
            -- local vlog = require('vlog')
            -- vlog.info('lsp provider failed, fallback to indent provider')
            -- --return handleFallbackException(err, 'indent')
        end)
    end

    require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
            return ftMap[filetype] or customizeSelector
        end
    })
end

function M.setup()

    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    selectProviderWithChainByDefault()
    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

return M
