return {
	'nvim-lualine/lualine.nvim',
	opts = {
		options = {
			icons_enabled = true,
			component_separators = ' ',
			section_separators = { left = '', right = '' },
			symbols = {
				modified = '', -- 󰐗   󰐙  ', --   󱞂 
				readonly = '', -- 󰅙   󰅚  ', --   󱙒
				unnamed = '', --󱗼󱗿 󰘦  
				newfile = '󰎔',
			},
		},
		extensions = {
			--'oil',
			-- 'trouble',
			-- 'quickfix',
			'toggleterm',
		},
		sections = {
			lualine_a = { { 'macro-recording', fmt = function()
				local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
					return ""
				else
					return "Recording @" .. recording_register
				end
			end } },
			-- TODO: replace toggleterm ext
			-- local current_ft = refresh_real_curwin and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(refresh_real_curwin), 'filetype') or vim.bo.filetype
			lualine_b = { { 'filename', separator = { left = '', right = '' }, } },
			lualine_c = {
				{
					"diff",
					source = function()
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
					padding = { left = 2, right = 2 },
					symbols = {
						added = "+ ",
						modified = "~ ",
						removed = "- ",
					},
					-- diff_color = {
					-- 	added = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsAdd")), "fg#"),
					-- 	-- bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- 	modified = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsChange")), "fg#"),
					-- 	--  bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- 	removed = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsDelete")), "fg#"),
					-- 	-- bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- },
					cond = nil,
				},
				-- TODO: pyenv
				-- {
				-- 	function()
				-- 		local utils = require "lvim.core.lualine.utils"
				-- 		if vim.bo.filetype == "python" then
				-- 			local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
				-- 			if venv then
				-- 				local icons = require "nvim-web-devicons"
				-- 				local py_icon, _ = icons.get_icon ".py"
				-- 				return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
				-- 			end
				-- 		end
				-- 		return ""
				-- 	end,
				-- 	color = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsAdd")), "fg#") },
				-- 	cond = conditions.hide_in_width,
				-- }
			},
			lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn =  " ",
							info =  " ",
							hint =  " ",
						},
						-- cond = conditions.hide_in_width,
					},
					{ "filetype", cond = nil, padding = { left = 1, right = 2 } },
			},
			lualine_y = {{ 'branch', icon = {'󰊢', color={fg='#f1502f'}}, separator = { left = '', right = '' }, }},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {}
		},
	}
}