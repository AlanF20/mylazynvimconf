return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
         local dashboard = require("alpha.themes.dashboard")  
				 -- Configurar el header
				 dashboard.section.header.val = {
					 [[ █████╗ ██╗      █████╗ ███╗   ██╗   ██████╗ ███████╗██╗   ██╗]],
					 [[██╔══██╗██║     ██╔══██╗████╗  ██║   ██╔══██╗██╔════╝██║   ██║]],
					 [[███████║██║     ███████║██╔██╗ ██║   ██║  ██║█████╗  ██║   ██║]],
					 [[██╔══██║██║     ██╔══██║██║╚██╗██║   ██║  ██║██╔══╝  ╚██╗ ██╔╝]],
					 [[██║  ██║███████╗██║  ██║██║ ╚████║██╗██████╔╝███████╗ ╚████╔╝ ]],
					 [[╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═════╝ ╚══════╝  ╚═══╝  ]],
					 [[                                                              ]],
				 }

				 -- Configurar los íconos (esta línea debe ir antes del setup)
				 dashboard.section.header.opts.hl = "Include"
				 dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
				 dashboard.opts.opts.noautocmd = true

				 -- Configurar el plugin
				 require('alpha').setup(dashboard.config)
    end
}
