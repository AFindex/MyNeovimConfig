local M = {}

function M.setup()
    local whichkey = require "which-key"
    local conf = {
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
        },
    }

    whichkey.setup(conf)

    -- normal mode
    local opts = {
        mode = "n", -- Normal mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    }

    local mappings = {
        -- ["w"] = { "<cmd>update!<CR>", "Save" },
        ["Q"] = { "<cmd>q!<CR>", "Quit" },

        n = {
            name = "snippet",
            n = {
                function()
                    vim.fn["vsnip#jumpable"](1)
                end,
                "next"
            },
            m = {
                function()
                    vim.fn["vsnip#jumpable"](-1)
                end,
                "prev"
            },
            j = {
                function()
                    vim.fn["vsnip#available"](1)
                end,
                "prev"
            },
        },

        m = {
            name = "LSP Mason config & Minimap",
            m = { "<cmd>Mason<CR>", "Open Mason float window" },
            p = { "<cmd>execute \"MinimapToggle\" | MinimapRefresh<CR>", "open minimap" }
        },

        -- LSP
        l = {
            name = "LSP commands",
            e = {
                name = "LSP diagnostic",
                e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open diagnostic float window" },
                s = { "<cmd>lua vim.diagnostic.show()<CR>", "show diagnostic" },
                h = { "<cmd>lua vim.diagnostic.hide()<CR>", "hide diagnostic" },
            },

            d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "definition " },
            D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition " },
            c = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration " },
            i = { "<cmd>lua vim.lsp.implementation()<CR>", "implementation " },
            r = { "<cmd>lua vim.lsp.buf.references()<CR>", "references " },
            --
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action " },
            k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature help " },
            h = { "<cmd>lua vim.lsp.buf.hover()<CR>", " hover " },

            -- async buf
            l = { function() vim.lsp.buf.format { async = true } end, "async current code buf" },

        },

        o = {
            name = "Oh Translate it ~ ",
            -- window
            w = { "<cmd>TranslateW<CR>", "Translate in window" },
            v = { "<cmd>Translate<CR>", "Translate in echo" },
        },

        b = {
            name = "Buffer",
            c = { "<Cmd>bd!<Cr>", "Close current buffer" },
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
        },

        f = {
            name = "Find",

            f = { "<cmd>Telescope find_files<CR>", "find files in current dir" },
            c = { "<cmd>Telescope commands<CR>", "search vim and plugin commands" },
            b = { "<cmd>Telescope buffers<CR>", "search buffers" },
            o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            -- f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
            -- b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
            --
            --o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
            --g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
            -- c = { "<cmd>FzfLua commands<cr>", "Commands" },
            e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        },

        z = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            p = { "<cmd>PackerProfile<cr>", "Profile" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },

        g = {
            name = "Git",
            s = { "<cmd>Neogit<CR>", "Status" },
        },

         
    }
    whichkey.register(mappings, opts)

    -- visual mode
    local visual_opts = {
        mode = "v", -- Normal mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    }

    local visual_mappings = {
        o = {
            name = "Oh Translate it in visual mode ~ ",
            w = { "<cmd>TranslateW<CR>", "Translate in window" },
            v = { "<cmd>Translate<CR>", "Translate in echo" },
        },
    }
    whichkey.register(visual_mappings, visual_opts)

    ---- insert mode
    --local insert_opts = {
    --    mode = "i", -- Normal mode
    --    prefix = "<leader>",
    --    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    --    silent = true, -- use `silent` when creating keymaps
    --    noremap = true, -- use `noremap` when creating keymaps
    --    nowait = false, -- use `nowait` when creating keymaps
    --}

    --local insert_mappings = {
    --    --n = {
    --    --    function()
    --    --        local ls = require('luasnip')
    --    --        if ls.choice_active() then
    --    --            ls.change_choice(1)
    --    --        end
    --    --    end,
    --    --    "snippet next",
    --    --},
    --    --m = {
    --    --    function()
    --    --        local ls = require('luasnip')
    --    --        if ls.choice_active() then
    --    --            ls.change_choice(-1)
    --    --        end
    --    --    end,
    --    --    "snippet prev",
    --    --},
    --    --e = {
    --    --    function()
    --    --        local ls = require('luasnip')
    --    --        if ls.choice_active() then
    --    --            ls.expand_auto()
    --    --        end
    --    --    end,
    --    --    "snippet expand",
    --    --},
    --    ----s = {
    --    ----    function()
    --    ----        vim.fn["vsnip#"](1)
    --    ----    end,
    --    ----    "prev"
    --}
    --whichkey.register(insert_mappings, insert_opts)


end

return M

-- f = {
--   name = "Find",
--   f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
--   b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
--   o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
--   g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
--   c = { "<cmd>FzfLua commands<cr>", "Commands" },
--   e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
-- }
