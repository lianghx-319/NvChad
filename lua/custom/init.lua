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
opt.textwidth = 120
opt.colorcolumn = "+1"
opt.spell = true
opt.spelllang = "en_us"
