local M = {}

local function run_nearest()
  local neotest = require "neotest"
  -- neotest.output_panel.open()
  neotest.run.run()
end

M.general = {
  n = {
    -- later maybe?
    -- ["<C-h>"] = { ":TmuxNavigatorLeft <CR>", "Tmux Navigate Left" },
    -- ["<C-j>"] = { ":TmuxNavigatorDown <CR>", "Tmux Navigate Down" },
    -- ["<C-k>"] = { ":TmuxNavigatorUp <CR>", "Tmux Navigate Up" },
    -- ["<C-l>"] = { ":TmuxNavigatorRight <CR>", "Tmux Navigate Right" },

    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Toggle neotree", opts = { nowait = true } },
    ["<leader>o"] = { ":NvimTreeFocus <CR>", "Open neotree", opts = { nowait = true } },

    ["<leader>h"] = { ":noh<CR>", "No highlight" },

    ["|"] = { ":vsplit <CR>", "Vertical split" },
    ["\\"] = { ":split <CR>", "Horizontal Split" },
    ["<leader>z"] = { ":ZenMode <CR>", "Open Zen Mode" },

    -- dap shortcuts
    ["<F2>"] = { ":lua require'dap'.toggle_breakpoint() <CR>", "Toggle Breakpoint" },
    ["<leader>dt"] = { ":lua require'dapui'.toggle() <CR>", "Toggle DUP UI" },
    ["<F8>"] = { ":lua require'dap'.step_into() <CR>", "Step Into" },
    ["<F9>"] = { ":lua require'dap'.step_over() <CR>", "Step Over" },
    ["<F10>"] = { ":lua require'dap'.continue() <CR>", "Continue" },

    ["<M-f>"] = { ":ToggleTerm direction=float <CR>", "Open terminal float" },
    ["<M-h>"] = { ":ToggleTerm direction=horizontal <CR>", "Open terminal horizontal" },
    ["<M-v>"] = { ":ToggleTerm direction=vertical <CR>", "Open terminal vertical" },

    -- trouble toggle
    ["<leader>tt"] = { ":TroubleToggle <CR>", "Trouble Toggle" },
    ["<leader>tn"] = { ":Trouble <CR>", "Next Trouble" },

    -- diagnostic
    ["]d"] = { ":lua vim.diagnostic.goto_next() <CR>", "Next Diagnostic" },
    ["[d"] = { ":lua vim.diagnostic.goto_prev() <CR>", "Prev Diagnostic" },
    ["<leader>ti"] = { ":lua vim.diagnostic.open_float() <CR>", "Set Qflist" },

    -- test runners
    ["<leader>dr"] = { run_nearest, "Run Nearest Test" },
    ["<leader>df"] = { ":lua require'neotest'.run.run(vim.fn.expand('%'))", "Run File" },
    ["<leader>dd"] = { ":lua require('neotest').run.run({strategy = 'dap'}) <CR>", "Debug nearest test" },
    ["<leader>dc"] = { ":lua require'neotest'.output_panel.toggle() <CR> ", "Toggle output panel" },
    ["<leader>ds"] = { ":lua require'neotest'.summary.toggle() <CR>", "Toggle summary" },
    ["<leader>dts"] = { ":lua require('neotest').output.open({ enter = true }) <CR>", "Test status" },

    -- harpoon
    ["<leader>a"] = { ":lua require('harpoon.mark').add_file() <CR>", "Add file to harpoon" },
    ["<M-u>"] = { ":lua require('harpoon.ui').toggle_quick_menu() <CR>", "Toggle harpoon menu" },

    ["<leader>1"] = { ":lua require'harpoon.ui'.nav_file(1) <CR>", "Harpoon 1" },
    ["<leader>2"] = { ":lua require'harpoon.ui'.nav_file(2) <CR>", "Harpoon 2" },
    ["<leader>3"] = { ":lua require'harpoon.ui'.nav_file(3) <CR>", "Harpoon 3" },
    ["<leader>4"] = { ":lua require'harpoon.ui'.nav_file(4) <CR>", "Harpoon 4" },
    ["<leader>5"] = { ":lua require'harpoon.ui'.nav_file(5) <CR>", "Harpoon 5" },
  },
  i = {
    ["jk"] = { "<ESC>", "escape normal mode" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move line up" },
  },
}

return M
