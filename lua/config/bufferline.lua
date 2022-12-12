local M = {}

function M.setup()

    require('bufferline').setup
    {
        options =
        {
            mode = "tabs", -- "buffers", -- set to "tabs" to only show tabpages instead
            numbers = "buffer_id",
            close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            -- name_formatter = function(buf)  -- buf contains:
            --       -- name                | str        | the basename of the active file
            --       -- path                | str        | the full path of the active file
            --       -- bufnr (buffer only) | int        | the number of the active buffer
            --       -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
            --       -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
            -- end,
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "

                return " " .. icon .. count
                --
                --return "("..count..")"
            end,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            custom_filter = function(buf_number, buf_numbers)
                -- filter out filetypes you don't want to see
                if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    return true
                end
                -- filter out by buffer name
                if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                    return true
                end
                -- filter out based on arbitrary rules
                -- e.g. filter out vim wiki buffer from tabline in your work repo
                if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    return true
                end
                -- filter out by it's index number in list (don't show first buffer)
                if buf_numbers[1] ~= buf_number then
                    return true
                end
            end,

            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                }
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
            enforce_regular_tabs = true,
            always_show_bufferline = true,

            sort_by = function(buf_a, buf_b)

                if not buf_a and buf_b then
                    return true
                elseif buf_a and not buf_b then
                    return false
                end

                return buf_a.id < buf_b.id
                -- print(vim.inspect(buffer_a))

                -- function bool_to_number(value)
                --     return value and 1 or 0
                -- end
                -- add custom logic
                -- return  bool_to_number(buffer_a.modified) >= bool_to_number(buffer_b.modified)
            end,
        }
    }


    -- local nvim_tree_events = require('nvim-tree.events')
    -- local bufferline_api = require('bufferline.api')
    --
    -- local function get_tree_size()
    --   return require'nvim-tree.view'.View.width
    -- end
    --
    -- nvim_tree_events.subscribe('TreeOpen', function()
    --   bufferline_api.set_offset(get_tree_size())
    -- end)
    --
    -- nvim_tree_events.subscribe('Resize', function()
    --   bufferline_api.set_offset(get_tree_size())
    -- end)
    --
    -- nvim_tree_events.subscribe('TreeClose', function()
    --   bufferline_api.set_offset(0)
    -- end)

end

return M
