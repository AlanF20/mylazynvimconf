return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'DaikyXendo/nvim-web-devicons',
	opts = function()
		require('bufferline').setup {
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " "
								or (e == "warning" and " " or " ")
						s = s .. n .. sym
					end
					return s
				end },
		}
	end,
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },        -- Mapeo existente
		{ "<C-w>", "<cmd>BufferLineClose<cr>",     desc = "Close current tab" }, -- Nuevo mapeo para cerrar la pestaña
	}
}
