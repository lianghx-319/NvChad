local opt = vim.opt
local g = vim.g
-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-------------------------------------- globals ------------------------------------------
g.dap_virtual_text = true

-------------------------------------- options ------------------------------------------
opt.relativenumber = true -- default relative line number
opt.textwidth = 80
opt.colorcolumn = '+1'
