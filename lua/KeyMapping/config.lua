vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

local opt = vim.opt
local keyBindVim = vim

keyBindVim.keymap.set('i', 'jk', '<ESC>')
keyBindVim.keymap.set("n", "<leader>e", "$")

-- keyBindVim.keymap.set("n","<leader>q","<CMD>:wq<CR>")
-- keyBindVim.keymap.set("n","<leader>w","<c-w>",{noremap=false})

-- keyBindVim.keymap.set("n","<leader>wh","<c-w>h")
-- keyBindVim.keymap.set("n","<leader>wl","<c-w>l")

keyBindVim.opt.tabstop = 4
keyBindVim.opt.shiftwidth = 4
keyBindVim.opt.expandtab = true
keyBindVim.bo.softtabstop = 2
keyBindVim.wo.number = true

opt.foldlevel = 20

-- hybrid number --
vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]]
-- h/t https://jeffkreeftmeijer.com/vim-number/
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
