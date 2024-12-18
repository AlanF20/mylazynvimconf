return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope', -- Carga Telescope cuando se invoca el comando :Telescope
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
    { '<leader>fs', function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Search Text" },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
    })
  end
}


