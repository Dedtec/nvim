return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons", lazy=true },
	opts = {
		view_options = {
			is_always_hidden = function(name, bufnr)
				return vim.startswith(name, '.DS_Store')
			end,
		},
		float = {
			padding = 4,
			max_width = 80,
		},
	},
	config = function(_, opts)
		require('oil').setup(opts)
		vim.keymap.set('n', '-', require('oil').open_float, {desc = 'Open parent directory'})
	end
}
