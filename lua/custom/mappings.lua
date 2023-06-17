---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- switch between windows with vim-tmux-navigator
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "Tmux left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight <CR>", "Tmux right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "Tmux down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "Tmux up" },
  },
}

-- more keybinds!

return M
