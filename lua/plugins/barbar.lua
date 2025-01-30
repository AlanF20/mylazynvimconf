return {
	'romgrk/barbar.nvim',
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	},
	init = function()
		vim.g.barbar_auto_setup = false	
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = true,
		clickable = true,
		focus_on_close = "left",
		icons = {
			buffer_index = false,
			buffer_number = false,
			button = '',
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
				[vim.diagnostic.severity.WARN] = {enabled = false},
				[vim.diagnostic.severity.INFO] = {enabled = false},
				[vim.diagnostic.severity.HINT] = {enabled = true},
			},
			gitsigns = {
				added = {enabled = true, icon = '+'},
				changed = {enabled = true, icon = '~'},
				deleted = {enabled = true, icon = '-'},
			},
		},
	},
	keys = {
		{"<Tab>", "<cmd>BufferNext<cr>", desc = "Change tab"},
		{"<C-w>", "<cmd>bd<cr>", desc = "Change tab"},
		{"<leader>1", "<cmd>BufferGoto 1<cr>", desc = "Change index 1"},
		{"<leader>2", "<cmd>BufferGoto 2<cr>", desc = "Change index 2"},
		{"<leader>3", "<cmd>BufferGoto 3<cr>", desc = "Change index 3"},
		{"<leader>4", "<cmd>BufferGoto 4<cr>", desc = "Change index 4"},
		{"<leader>5", "<cmd>BufferGoto 5<cr>", desc = "Change index 5"},
		{"<leader>6", "<cmd>BufferGoto 6<cr>", desc = "Change index 6"},
		{"<leader>7", "<cmd>BufferGoto 7<cr>", desc = "Change index 7"},
		{"<leader>8", "<cmd>BufferGoto 8<cr>", desc = "Change index 8"},
		{"<leader>9", "<cmd>BufferGoto 9<cr>", desc = "Change index 9"}
	}
}
