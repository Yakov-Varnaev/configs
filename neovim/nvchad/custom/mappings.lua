---@type MappingsTable
local M = {}

M.disabled = {
  ["<C-n>"] = "",
  ["<leader>0"] = "",
  ["<leader>h"] = "",
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>e"] = { ":NvimTreeToggle <CR>", "Toggle neotree", opts = { nowait = true } },
    ["<leader>o"] = { ":NvimTreeFocus <CR>", "Open neotree", opts = { nowait = true } },
    ["<leader>h"] = { ":noh <CR> ", "No highlight" },

    -- Window managing
    ["|"] = { ":vsplit <CR>", "Vertical split"},
    ["\\"] = { ":split <CR>", "Horizontal Split" },
    ["<leader>z"] = { ":ZenMode <CR>" , "Open Zen Mode" },

    -- dap
    -- ["<leader>ds"] = { ":lua require'dupui'.toggle() <bar> lua require'dap'.continue()<CR>", "Continue" },
    ["<F2>"] = { ":lua require'dap'.toggle_breakpoint() <CR>", "Toggle Breakpoint"},
    ["<leader>dt"] = { ":lua require'dapui'.toggle() <CR>", "Toggle DUP UI"},
    ["<F8>"] = { ":lua require'dap'.step_into() <CR>", "Step Into" },
    ["<F9>"] = { ":lua require'dap'.step_over() <CR>", "Step Over" },
    ["<F10>"] = { ":lua require'dap'.continue() <CR>", "Continue" },
    ["<leader>ff"] = { ":Telescope git_files <CR>", "Telescope" },

    -- ["<M-i>"]= { ":ToggleTerm direction=float <CR>", "Open Float Terminal",},
    -- ["<leader>th"]= { ":ToggleTerm direction=horizonatal<CR>", "Open Horizontal Terminal",},
    -- ["<leader>tv"]= { ":ToggleTerm direction=float <CR>", "Open Vertical Terminal",},
  },
  t = {
    -- ["<M-i>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-n><M-i>", true, true, true), "Exit Terminal Mode" },
  }
}

-- more keybinds!

return M
