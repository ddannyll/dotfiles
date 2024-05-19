-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = function(client, buffer)
    on_attach(client, buffer)
    vim.keymap.set("n", "gd", "<cmd> TroubleToggle lsp_definitions<CR>", { desc = "Trouble LSP Definitions" })
    vim.keymap.set("n", "gr", "<cmd> TroubleToggle lsp_references<CR>", { desc = "Trouble LSP References" })
  end,
  on_init = on_init,
  capabilities = capabilities,
}
