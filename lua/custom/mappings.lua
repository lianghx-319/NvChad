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

    -- toggle transparency
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency"
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

-- more keybinds!

return M
