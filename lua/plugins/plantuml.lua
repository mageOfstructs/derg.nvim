return {
	"https://gitlab.com/itaranto/plantuml.nvim",
	version = "*",
	opts = {
		renderer = {
			type = "imv",
			options = {
				dark_mode = true,
				format = nil, -- Allowed values: nil, 'png', 'svg'.
			},
		},
		render_on_write = true,
	},
	keys = {
		{ "<leader>p", "<cmd>PlantUML<cr>", desc = "Open PlantUML" },
	},
	-- ft = { "plantuml", "iuml", "puml", "pu", "wsd" },
}
