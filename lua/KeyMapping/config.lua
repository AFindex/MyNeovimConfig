vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

local keyBindVim = vim
keyBindVim.keymap.set('i','jk','<ESC>')
keyBindVim.keymap.set("n","<leader>e","$")
keyBindVim.keymap.set("n","<leader>w","<c-w>")

keyBindVim.opt.tabstop = 4
keyBindVim.opt.shiftwidth = 4
keyBindVim.opt.expandtab = true
keyBindVim.bo.softtabstop = 2

