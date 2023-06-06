local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

-- local adapters = {'python'}  --list your adapters here

-- for _, adapter in ipairs(adapters) do
--   require("custom.plugins.dap_configs." .. adapter)
-- end

local function dap_mappings()
   vim.api.nvim_set_keymap("n", "<leader>r", '<cmd>lua require"dap".repl.toggle()<cr>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<leader>d", '<cmd>lua require"dapui".toggle()<cr>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<c-b>", '<cmd>lua require"dap".toggle_breakpoint()<cr>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<c-c>", '<cmd>:lua require"dap".continue()<cr>',{
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<c-s>", '<cmd>lua require"dap".step_over()<cr>', {
      silent = true,
      noremap = true,
   })
   vim.api.nvim_set_keymap("n", "<c-s>", '<cmd>lua require"dap".step_into()<cr>', {
      silent = true,
      noremap = true,
   })
end

dap_mappings()

--if you do not want to use dapui, specific widget windows can be loaded via lua instead like so
-- vim.api.nvim_set_keymap("n", "<leader>s", '<cmd>lua require"custom.plugins.dap_configs.widget_config".load_scope_in_sidebar()<cr>', {
--    silent = true,
--    noremap = true,
-- })
-- where custom.plugins.dap_configs.widget_config contains:
-- m = {}
-- local widgets = require('dap.ui.widgets')
--
-- m.load_scope_in_sidebar = function ()
--   local my_sidebar = widgets.sidebar(widgets.scopes)
--   my_sidebar.toggle()
-- end
--
-- return M
