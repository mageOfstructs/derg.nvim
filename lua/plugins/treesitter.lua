return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
	},
}
