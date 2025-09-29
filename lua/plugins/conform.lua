return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			if vim.api.nvim_buf_get_name(bufnr):find("clones/contributions", 0, true) then
				return nil -- don't destroy the formating of others
			end
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt", lsp_format = "fallback" },
			java = { "clang-format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			markdown = { "markdownlint" },
			javascript = { "biome" },
			html = { "prettier" },
			-- sql = { "sql-formatter" },
		},
	},
}
