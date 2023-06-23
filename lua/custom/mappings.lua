---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<leader>ca"] = "", -- disabled lsp code action
    ["<leader>ra"] = "", -- disabled lsp rename
    ["K"] = "", -- disabled hover doc
    ["gD"] = "", -- disabled lsp goto_definition
    ["<leader>D"] = "", -- disabled lsp goto_type_definition
    ["<leader>f"] = "", -- disabled lsp float diagnostics
  },
}

M.lspsaga = {
  plugin = true,
  n = {
    ["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "Lspsaga finder" },
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Lspsaga code action" },
    ["gr"] = { "<cmd>Lspsaga rename ++project<CR>", "Lspsaga rename" },
    ["gp"] = { "<cmd>Lspsaga peek_definition<CR>", "Lspsaga peek definition" },
    ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Lspsaga goto definition" },
    ["gt"] = { "<cmd>Lspsaga peek_type_definition<CR>", "Lspsaga peek type definition" },
    ["<leader>sl"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Lspsaga show line diagnostics" },
    ["<leader>sw"] = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Lspsaga show workspace diagnostics" },
    ["<leader>sc"] = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Lspsaga show cursor diagnostics" },
    ["[e"] = {
      function()
        require("lspsaga.diagnostic"):goto_prev { severity = vim.diagnostic.severity.ERROR }
      end,
      "Lspsaga goto prev error",
    },
    ["]e"] = {
      function()
        require("lspsaga.diagnostic"):goto_next { severity = vim.diagnostic.severity.ERROR }
      end,
      "Lspsaga goto prev error",
    },
    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Lspsage hover doc" },
    ["<leader>o"] = { "<cmd>Lspsaga outline<CR>", "Lspsaga outline" },
    ["<leader>ci"] = { "<cmd>Lspsaga incoming_calls<CR>", "Lspsaga incoming calls" },
    ["<leader>co"] = { "<cmd>Lspsaga outgoing_calls<CR>", "Lspsaga outgoing calls" },
  },
  v = {
    ["<leader>ca"] = { "<cmd>Lspsaga code_action<CR>", "Lspsaga code action" },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Open Lazygit" },
  },
}

M.tmux = {
  n = {
    -- switch between windows with vim-tmux-navigator
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Tmux left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Tmux right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Tmux down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Tmux up" },
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- toggle transparency
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>" },
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
