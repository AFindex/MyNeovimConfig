local M = {}

function M.setup()
	require('nvim-tree').setup{
		disable_netrw = true,
		hijack_netrw = true,
		filters = {
			custom = {".git"},
		},

        actions = {
            open_file = {
                quit_on_open = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                }
            }

        }

	}
end

return M
