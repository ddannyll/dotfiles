---@type ChadrcConfig 
local M = {}
M.ui = {
  theme = 'onedark',
  transparency = true,
  statusline = {
    theme = "minimal"
  },
  nvdash = {
    load_on_startup = true,
  }
}

M.plugins = 'custom.plugins'
M.mappings = require "custom.mappings"
return M
