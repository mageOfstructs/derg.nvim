return {
	"williamboman/mason.nvim",
	dependencies = {
		-- "neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-lint",
		"mhartington/formatter.nvim",
	},
	cmd = {
		"Mason",
	},
	opts = {
		registries = {
			"github:nvim-java/mason-registry",
			"github:mason-org/mason-registry",
		},
	},
}
