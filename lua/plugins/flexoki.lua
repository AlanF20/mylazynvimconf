return {
	"kepano/flexoki-neovim",
	opts = function()
		require("lazy").setup({
			{ 'kepano/flexoki-neovim', name = 'flexoki' }
		})
	end
}
