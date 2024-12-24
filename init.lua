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

-- Mapeo para abrir Neotree en una ventana flotante
vim.keymap.set('n', 't', function()
	vim.cmd('Neotree float filesystem reveal')
end, { noremap = true, silent = true })

-- Guardar archivo con la tecla 'f' y formatear
vim.keymap.set('n', 'f', function()
	vim.cmd('LspZeroFormat')
	vim.cmd(':w')
end, { noremap = true, silent = true })
-- Duplicate keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<S-A-Up>', ':LineDuplicate -1<CR>', opts)
vim.keymap.set('n', '<S-A-Down>', ':LineDuplicate +1<CR>', opts)
-- Normal mode commands move
vim.keymap.set('n', '<A-Up>', ':MoveLine -1<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':MoveLine 1<CR>', opts)
vim.keymap.set('n', '<A-S-Left>', ':MoveWord -1<CR>', opts)
vim.keymap.set('n', '<A-S-Right>', ':MoveWord 1<CR>', opts)

-- Visual-mode commands
vim.keymap.set('x', '<A-Up>', ':MoveBlock -1<CR>', opts)
vim.keymap.set('x', '<A-Down>', ':MoveBlock 1<CR>', opts)
vim.keymap.set('v', '<A-Left>', ':MoveHBlock -1<CR>', opts)
vim.keymap.set('v', '<A-Right>', ':MoveHBlock 1<CR>', opts)
-- Aplica el esquema de colores
vim.cmd("colorscheme onedark_vivid")
