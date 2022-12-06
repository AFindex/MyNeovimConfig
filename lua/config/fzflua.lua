local M = {}
function M.setup()
    -- not support windows sad
    --
    -- local fzf_lua = require("fzf-lua")
    -- local builtin = require("fzf-lua.previewer.builtin")
    -- 
    -- -- Inherit from the "buffer_or_file" previewer
    -- local MyPreviewer = builtin.buffer_or_file:extend()
    -- 
    -- function MyPreviewer:new(o, opts, fzf_win)
    --   MyPreviewer.super.new(self, o, opts, fzf_win)
    --   setmetatable(self, MyPreviewer)
    --   return self
    -- end
    -- 
    -- function MyPreviewer:parse_entry(entry_str)
    --   -- Assume an arbitrary entry in the format of 'file:line'
    --   local path, line = entry_str:match("([^:]+):?(.*)")
    --   return {
    --     path = path,
    --     line = tonumber(line) or 1,
    --     col = 1,
    --   }
    -- end
    -- 
    -- fzf_lua.fzf_exec("rg --files", {
    --   previewer = MyPreviewer,
    --   prompt = "Select file> ",
    -- })
    -- fzf_lua.setup();
end
return M
