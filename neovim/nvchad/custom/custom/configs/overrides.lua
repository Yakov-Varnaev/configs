local M = {}

M.copilot = {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-/>",
      prev = "<M-j>",
      next = "<M-k>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",

    "html",
    "css",
    "javascript",

    "python",

    "go",

    "rust",

    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "jsonls",
    "prettier",

    -- golang
    "gopls",

    -- python
    "pyright",
    "debugpy",

    -- rust
    "rust-analyzer",
  },
}

M.nvimtree = {
  open_on_tab = true,
}

return M
