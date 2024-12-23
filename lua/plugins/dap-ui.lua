return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	opts = {},
	keys = {
		{ "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', desc = "Toggle DAP UI" },
	},
}
