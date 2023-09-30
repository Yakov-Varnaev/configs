local overrides = require "custom.configs.overrides"

local plugins = {
  -- override configs
  --
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
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- add copilot to neovim
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  -- disable nvterm as it is a bit ugly and use toggle term instead
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<M-i>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1",
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
      }
    end,
  },
  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- debuggers
  {
    "mfussenegger/nvim-dap",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
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
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    opts = {
      floating = { border = "rounded" },
      layouts = {
        {
          elements = {
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "watches",
              size = 0.25,
            },
          },
          position = "bottom",
          size = 10,
        },
      },
    },
    lazy = false,
    config = function(_, opts)
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      dapui.setup(opts)
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "VimEnter",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function(_, _)
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
          },
          require "neotest-go" {},
        },
      }
    end,
  },
  {
    "nvim-neotest/neotest-python",
    ft = "python",
    requires = {
      "nvim-neotest/neotest",
    },
    dependencies = {
      "nvim-neotest/neotest",
    },
  },
  {
    "nvim-neotest/neotest-go",
    ft = "go",
    requires = {
      "nvim-neotest/neotest",
    },
    dependencies = {
      "nvim-neotest/neotest",
    },
  },
  {
    "ThePrimeagen/harpoon",
    event = "VimEnter",
  },
  -- {
  --   "petobens/poet-v",
  --   ft = "python",
  -- },
}

return plugins
