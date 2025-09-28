return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"echasnovski/mini.nvim",
		{ "nvim-treesitter/nvim-treesitter" },
	}, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		pipe_table = {
			cell_offset = function(ctx)
				local offset = 0
				local row, start_col, _, end_col = ctx.node:range()
				local highlights = vim.api.nvim_buf_get_extmarks(
					0,
					-1,
					{ row, start_col },
					{ row, end_col },
					{ details = true, type = "highlight" }
				)
				for _, conceal_highlight in ipairs(highlights) do
					if conceal_highlight[4].hl_group == "Conceal" then
						offset = offset - (conceal_highlight[4].end_col - conceal_highlight[3])
						if conceal_highlight[4].virt_text then
							offset = offset + #conceal_highlight[4].virt_text[1]
						end
					end
				end
				return offset
			end,
		},
	},
	ft = "markdown",
	-- dir = "/home/dragon/clones/render-markdown.nvim/",
}
