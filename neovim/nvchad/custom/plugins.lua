local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          type_opts = {
            float = {
              row = 0.1,
              col = 0.05,
              width = 0.9,
              height = 0.8,
            },
          }
        }
      })
    end,
  },
  -- {
  --   "voldikss/vim-floaterm",
  --   config = function()
  --     require('vim-floaterm').setup()
  --   end,
  -- },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },
  -- {
  --   "mfussenegger/nvim-dap",
  -- },
  {
    'mfussenegger/nvim-dap',
    -- after = "coq_nvim",
    lazy = false,
    requires = {
      "Pocco81/DAPInstall.nvim",
    },
  },
  {
    "mfussenegger/nvim-dap-python",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "Pocco81/DAPInstall.nvim",
    lazy = false,
  },
  {
    lazy = false,
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    config = function()
      local dapui = require('dapui')
      local dap = require('dap')

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end,
  },
  -- {
  --   "olexsmir/gopher.nvim",
  --   ft = "go",
  --   config = function(_, opts)
  --     require("gopher").setup(opts)
  --   end,
  --   build = function()
  --     vim.cmd [[silent! GoInstallDeps]]
  --   end,
  -- },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require('treesitter-context').setup(opts)
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "VimEnter"
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
  },

  -- Terminals
  -- disable nvterm
  -- {
  --   "NvChad/nvterm",
  --   enabled = false,
  -- },
  -- {
  --   "akinsho/nvim-toggleterm.lua",
  --   version= "*",
  --   config = true,
  --   event = "VimEnter",
  --   enable = false,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
