local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "tsserver",
  -- "ruff_lsp",
  "pyright",
  "gopls",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  html = {
    options = {
      ["bem.enabled"] = true,
    },
  },
}

lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- lspconfig.vls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "vls" },
--   filetypes = { "vue" },
-- }

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}
