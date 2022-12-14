vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

local opt = vim.opt
local keyBindVim = vim

keyBindVim.keymap.set('i', 'jk', '<ESC>')
keyBindVim.keymap.set("n", "<leader>e", "$")
keyBindVim.keymap.set("v", "<leader>e", "$")

keyBindVim.keymap.set("v", "<C-s>", ":w<CR>")
keyBindVim.keymap.set("n", "<C-s>", ":w<CR>")


keyBindVim.keymap.set("n", "<A-1>", "gT")
keyBindVim.keymap.set("n", "<A-2>", "gt")
-- keyBindVim.keymap.set("i", "<leader>e", "$")

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

vim.cmd [[ imap <silent><script><expr> <S-tab> copilot#Accept("\<CR>") ]]
vim.g.copilot_no_tab_map = true
-- vim.g.minimap_auto_start = 1
-- vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_highlight_search = 1
vim.g.minimap_highlight_range = 1
vim.g.minimap_enable_highlight_colorgroup = 1
vim.g.nvim_tree_auto_close = 1

-- vim.cmd[[call submode#enter_with('grow/shrink', 'n', '', '<leader><up>', '<C-w>+')]]
-- vim.cmd[[call submode#enter_with('grow/shrink', 'n', '', '<leader><down>', '<C-w>-')]]
-- vim.cmd[[call submode#map('grow/shrink', 'n', '', '<down>', '<C-w>-')]]
-- vim.cmd[[call submode#map('grow/shrink', 'n', '', '<up>', '<C-w>+')]]
-- 
-- vim.cmd[[call submode#enter_with('grow/horshrink', 'n', '', '<leader><left>', '<C-w><')]]
-- vim.cmd[[call submode#enter_with('grow/horshrink', 'n', '', '<leader><right>', '<C-w>>')]]
-- vim.cmd[[call submode#map('grow/horshrink', 'n', '', '<left>', '<C-w><')]]
-- vim.cmd[[call submode#map('grow/horshrink', 'n', '', '<right>', '<C-w>>')]]
-- local ls = require("luasnip")
-- local cmp = require("cmp")

--vim.keymap.set({ "i", "s" }, "<C-n>", function()
--    if ls.choice_active() then
--        --return "<Plug>luasnip-next-choice"
--        --
--        cmp.mapping.select_prev_item()
--        --ls.change_choice(1)
--    end
--end
--)
--
--vim.keymap.set({ "i", "s" }, "<C-m>", function()
--    if ls.choice_active() then
--        --return "<Plug>luasnip-next-choice"
--        cmp.mapping.select_next_item()
--        --ls.change_choice(-1)
--    end
--end)
--
--vim.keymap.set({ "i", "s" }, "<CR>", function()
--    if ls.choice_active() then
--        --return "<Plug>luasnip-next-choice"
--        cmp.mapping.confirm({ select = true })
--        --ls.change_choice(-1)
--    else
--        return "<CR>"
--    end
--end)


--vim.cmd[[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']]
--vim.cmd[[inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>]]
--vim.cmd[[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>]]
--vim.cmd[[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>]]
--vim.cmd[[imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]
--vim.cmd[[smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']]

-- h/t https://jeffkreeftmeijer.com/vim-number/
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
