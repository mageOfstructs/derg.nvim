return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<F8>", "<CMD>:ToggleTerm size=40 direction=float<CR>" },
		{ "<F8>", "<CMD>:ToggleTerm size=40 direction=float<CR>", mode = "t" },
		{ "<F8>", "<CMD>:ToggleTerm size=40 direction=float<CR>", mode = "i" },
	},
	opts = {
		start_in_insert = true,
		direction = "float",
		auto_scroll = true,
		float_opts = {
			border = "double",
		},
	},
}
