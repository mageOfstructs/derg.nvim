return {
	"mageOfStructs/kiwi.nvim",
	opts = {
		--[[ append_heading = true,
		folders = --]]
		{
			name = "legacy",
			path = "/home/jason/obsidian",
		},
		{
			name = "Docs",
			path = "/home/jason/clones/Docs",
		},
		{
			name = "Blog",
			path = "/home/jason/clones/website/thoughts/",
		},
	},
	keys = {
		{ "<leader>ww", ':lua require("kiwi").open_wiki_index()<cr>', desc = "Open Wiki index" },
		{
			"<leader>wd",
			':lua require("kiwi").open_wiki_index("Docs")<cr>',
			desc = "Open index of personal wiki",
		},
		{
			"<leader>wb",
			':lua require("kiwi").open_wiki_index("Blog")<cr>',
			desc = "Open index of blog",
		},
		{ "T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
	},
	lazy = true,
}
