local M = {}

function M.setup()

    local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
            vim.cmd [[packadd packer.nvim]]
            return true
        end
        return false
    end

    local packer_bootstrap = ensure_packer()
    local packer = require('packer')

    packer.startup({
        function(use)
            use 'wbthomason/packer.nvim'

            use {
                'anuvyklack/hydra.nvim',
                config = function()
                    require('config.hydra').setup()
                end
            }

            use "github/copilot.vim"

            use {
                'hrsh7th/vim-vsnip',
            }

            -- cmp
            use {
                "hrsh7th/nvim-cmp",
                requires = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                    'hrsh7th/cmp-cmdline',
                },
                config = function()
                    require('config.nvim_cmp').setup()
                end
            }

            use{
                'norcalli/nvim-colorizer.lua',
                config = function()
                    vim.opt.termguicolors = true
                    require('colorizer').setup{
                        '*',
                        '!vim'
                    }
                end
            }

            -- neo vim logger
            use {
                "L3MON4D3/LuaSnip",
                tag = "v<CurrentMajor>.*"
            }

            use {
                "nvim-zh/colorful-winsep.nvim",
                config = function()
                    require("config.winsep").setup()
                end
            }

            use {
                "williamboman/mason.nvim",
                config = function()
                    require("config.Lsp.mason").setup()
                end,
            }


            use {
                'karb94/neoscroll.nvim',
                config = function()
                    require("config.neoscroll").setup()
                end,
            }

            -- status line
            use({
                "NTBBloodbath/galaxyline.nvim",
                -- your statusline
                config = function()
                    require("galaxyline.themes.eviline")
                end,
                -- some optional icons
                requires = { "kyazdani42/nvim-web-devicons", opt = true }
            })

            -- Buffer line
            use {
                'akinsho/bufferline.nvim',
                tag = "v3.*",
                requires = {
                    'nvim-tree/nvim-web-devicons',
                    'kyazdani42/nvim-tree.lua',
                },
                config = function()
                    require('config.bufferline').setup()
                end,

                cond = function()
                    -- if packer_plugins["nvim-tree"] and packer_plugins["nvim-tree"].loaded then
                    --     print("nvim-tree is loaded")
                    --     return true
                    -- end
                    return true
                end
            }
            -- User interface
            use {
                "stevearc/dressing.nvim",
                config = function()
                    require("dressing").setup {
                        select = {
                            backend = { "telescope", "fzf", "builtin" },
                        },
                    }
                end,
            }

            use {
                'goolord/alpha-nvim',
                config = function()
                    require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
                end
            }
            -- shift window
            use {
                'sindrets/winshift.nvim',
                config = function()
                    require('config.winshift').setup()
                end
            }

            -- scrollbar
            use {
                "wfxr/minimap.vim",
                config = function()
                    -- todo : auto cmd todo
                end
            }

            use {
                "petertriho/nvim-scrollbar",
                config = function()
                    require('config.scrollbar').setup()
                end
            }

            use {
                "kevinhwang91/nvim-hlslens",
                config = function()
                    require("hlslens").setup({
                        build_position_cb = function(plist, _, _, _)
                            require("scrollbar.handlers.search").handler.show(plist.start_pos)
                        end,
                    })
                    vim.cmd([[
                    augroup scrollbar_search_hide
                        autocmd!
                        autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
                    augroup END
                ]]   )
                end,
            }

            use { 'kyazdani42/nvim-web-devicons' }
            -- My plugins here
            use {
                'neovim/nvim-lspconfig',
                config = function()
                    require("config.Lsp.nvim_lsp_config").setup()
                end
            }

            -- transalte
            use {
                "voldikss/vim-translator",
                config = function()
                    vim.g.translator_default_engines = { 'bing' }
                    -- vim.g.translator_proxy_url = 'socks5://127.0.0.1:10808'
                end
            }

            use {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("config.indentBlankline").setup()
                end
            }
            -- LSP Folding
            use {
                "kevinhwang91/nvim-ufo",
                requires = "kevinhwang91/promise-async",
                config = function()
                    require("config.ufo").setup()
                end
            }


            use "tpope/vim-vinegar"

            use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                requires = {
                    "nvim-lua/plenary.nvim",

                },
                config = function()
                    require("config.telescope").setup()
                    require("config.telescope").load_extensions()
                end,
            }


            use {
                'folke/tokyonight.nvim',
                config = function()
                    require("config.tokyonight").setup()
                end,
            }

            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons",
                },
                cmd = { "NvimTreeToggle", "NvimTreeClose" },

                config = function()
                    require("config.nvimtree").setup()
                end,
            }
            -- WhichKey
            use {
                "folke/which-key.nvim",
                event = "VimEnter",

                config = function()
                    require("config.whichkey").setup()
                end,
            }

            -- Automatically set up your configuration after cloning packer.nvim
            -- Put this at the end after all plugins
            if packer_bootstrap then
                require('packer').sync()
            end
        end,
        config = {
            display = {
                open_fn = require('packer.util').float,
            }
        },
    })

end

return M
