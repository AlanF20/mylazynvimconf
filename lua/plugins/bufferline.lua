return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'DaikyXendo/nvim-web-devicons',
	opts = function()
		require('bufferline').setup {
			options = {
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end, }
		}
	end,
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },        -- Mapeo existente
		{ "<C-w>", "<cmd>BufferLinePickClose<cr>", desc = "Close current tab" }, -- Nuevo mapeo para cerrar la pestaña
	}
}
