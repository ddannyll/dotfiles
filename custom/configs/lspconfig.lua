local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- lspconfig.gopls.setup {
--   on_attack = on_attach,
--   capabilities = capabilities,
--   cmd = {"gopls"},
--   filetypes = {"go", "gomod", "gowork", "gotmpl"},
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       analyses = {
--         unusedparams = true,
--       },
--     },
--   },
-- }

local servers = {"tsserver", "eslint", "gopls"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
