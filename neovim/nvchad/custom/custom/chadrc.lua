---@type ChadrcConfig
local M = {}

local mappings = require "custom.mappings"

M.ui = {
  theme = "ayu_dark",
  theme_toggle = { "catppuccin", "ayu_dark" },
}
M.mappings = mappings
M.plugins = "custom.plugins"

return M
