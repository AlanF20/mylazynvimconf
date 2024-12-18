return 		 {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
				local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	[[ █████╗ ██╗      █████╗ ███╗   ██╗   ██████╗ ███████╗██╗   ██╗]],
	[[██╔══██╗██║     ██╔══██╗████╗  ██║   ██╔══██╗██╔════╝██║   ██║]],
	[[███████║██║     ███████║██╔██╗ ██║   ██║  ██║█████╗  ██║   ██║]],
	[[██╔══██║██║     ██╔══██║██║╚██╗██║   ██║  ██║██╔══╝  ╚██╗ ██╔╝]],
	[[██║  ██║███████╗██║  ██║██║ ╚████║██╗██████╔╝███████╗ ╚████╔╝ ]],
	[[╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═════╝ ╚══════╝  ╚═══╝  ]],
	[[                                                              ]],
}

require("alpha").setup(dashboard.opts)
end
}

