return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			-- plugins = { "nvim-dap-ui" },
			-- types = true,
			"nvim-dap-ui",
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
}
