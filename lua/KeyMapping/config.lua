vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

local keyBindVim = vim
keyBindVim.keymap.set('i','jk','<ESC>')
keyBindVim.keymap.set("n","<leader>e","$")
keyBindVim.keymap.set("n","<leader>q","<CMD>:wq<CR>")
keyBindVim.keymap.set("n","<leader>w","<c-w>",{noremap=false})

-- keyBindVim.keymap.set("n","<leader>wh","<c-w>h")
-- keyBindVim.keymap.set("n","<leader>wl","<c-w>l")

keyBindVim.opt.tabstop = 4
keyBindVim.opt.shiftwidth = 4
keyBindVim.opt.expandtab = true
keyBindVim.bo.softtabstop = 2

