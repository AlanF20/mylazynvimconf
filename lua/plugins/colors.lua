return {
	'brenoprata10/nvim-highlight-colors',
	opts ={
		function ()
			require("nvim-highlight-colors").setup {
				---Render style
				---@usage 'background'|'foreground'|'virtual'
				render = 'virtual',

				---Set virtual symbol (requires render to be set to 'virtual')
				virtual_symbol = '■',
				---Set virtual symbol suffix (defaults to '')
				virtual_symbol_prefix = '',

				---Set virtual symbol suffix (defaults to ' ')
				virtual_symbol_suffix = ' ',
				--Set virtual symbol position()
				---@usage 'inline'|'eol'|'eow'
				virtual_symbol_position = 'inline',
			}
		end
	}
}
