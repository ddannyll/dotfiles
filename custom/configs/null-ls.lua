local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.prettier,
	formatting.stylua,
	formatting.gofumpt,
	formatting.golines,
	-- formatting.goimports_reviser.with({
	-- 	extra_args = { "-rm-unused" },
	-- }),
	null_ls.builtins.diagnostics.mypy,
	null_ls.builtins.diagnostics.ruff,
	formatting.black,

	lint.shellcheck,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ buffnr = bufnr })
				end,
			})
		end
	end,
})
