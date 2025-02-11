-- Configuración del leader antes de cargar keymaps o plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Lazy.nvim setup
require('config.lazy')

-- Opciones generales de Vim
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10

-- Mapas de teclas personalizados
vim.keymap.set('i', '<C-H>', '<C-W>', { noremap = true })

-- Mapeo para Ctrl + Backspace en modo inserción
vim.keymap.set('i', '<C-Backspace>', function()
	vim.cmd('db')
end, { noremap = true })

--- Mapeo para abrir Neotree en una ventana flotante
vim.keymap.set('n', 't', function()
	vim.cmd('Neotree float filesystem reveal')
end, { noremap = true, silent = true })

-- Guardar archivo con la tecla 'f' y formatear
vim.keymap.set('n', 'f', function()
	vim.cmd(':w')
end, { noremap = true, silent = true })
vim.g.material_style = "darker"
-- Aplica el esquema de colores
vim.cmd("colorscheme onedark_vivid")


