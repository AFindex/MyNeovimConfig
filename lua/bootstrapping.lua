local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'karb94/neoscroll.nvim',
        config = function()
            require("config.neoscroll").setup()
        end,
    }

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
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }
    --use {'kyazdani42/nvim-web-devicons'}
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
            vim.g.translator_default_engines = {'bing'}
            -- vim.g.translator_proxy_url = 'socks5://127.0.0.1:10808'
        end
    }

    use{
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.indentBlankline").setup()
        end
    }
    -- LSP Folding
    use{
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async",
    }


    use "tpope/vim-vinegar"

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { 
            "nvim-lua/plenary.nvim",
            --{
            --    'nvim-telescope/telescope-fzf-native.nvim',
            --    run = 'make', 
            --    config = function()
            --        require("config.telescope").setup()
            --        require("config.telescope").load_extensions()
            --    end,
            --}
        },
        config = function()
            require("config.telescope").setup()
            require("config.telescope").load_extensions()
        end,
    }

    -- -- barbar
    -- use 'nvim-tree/nvim-web-devicons'
    -- use {
    --     'romgrk/barbar.nvim',
    --     wants = 'nvim-web-devicons',
    --     config = function()
    --         require("config.barbar").setup()
    --     end,
    -- }


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

    -- not suport windows sad
    -- use { 
    --     'ibhagwan/fzf-lua',
    --     -- optional for icon support
    --     requires = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --       require("config.fzflua").setup()
    --     end,
    -- }
    --
    --
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)
