---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "everforest_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = { load_on_startup = true },
  transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.options = { nvchad_branch = "main" }

return M
