local autocmd = vim.api.nvim_create_autocmd

vim.opt.swapfile = false
vim.opt.scrolloff = 7
vim.opt.colorcolumn = "100"
vim.opt.relativenumber = true
vim.cmd [[ set nowrap ]]
vim.cmd [[ set foldmethod=expr]]
vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[ set nofoldenable ]]

-- debug stuff
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointCondition",
  { text = "🤔", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  { text = "❌", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)
vim.fn.sign_define(
  "DapLogPoint",
  { text = "🔵", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
)
vim.fn.sign_define(
  "DapStopped",
  { text = "➡️", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
)

-- autocommands
-- open nvim-tree on startup
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

autocmd("VimEnter", {
  callback = function()
    open_nvim_tree()
  end,
})
