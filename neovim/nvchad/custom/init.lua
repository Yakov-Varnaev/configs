local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--


-- autocmd("openTree", {
--  pattern = "*",
--  command = "NvimTreeOpen",
-- })

vim.opt.swapfile = false
vim.opt.scrolloff = 7
vim.cmd [[ set nowrap ]]
-- vim.opt.nowrap = true

-- vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
-- vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
-- vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#31353f' }, false)

-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='🔵', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='➡️', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- autocmd BufEnter * silent! lcd %:p:h
-- the same as autochdir but better for nvim-tree and other plugins.
autocmd("BufEnter", {
    pattern = "*",
    command = "silent! lcd %:p:h"
})


-- open nvim-tree on startup
local function open_nvim_tree()

  -- open the tree
 require("nvim-tree.api").tree.open()
end

autocmd("VimEnter", {
  callback = function ()
    open_nvim_tree()
  end;
})

-- load dap-python

autocmd("FileType", {
  pattern = "python",
  command = "lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')"
})

