return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Lista de parsers a instalar
      ensure_installed = { 
        "c", "lua", "vim", "vimdoc", "query", 
        "javascript", "rust", "vue", "typescript" 
      },

      -- Instala parsers de forma síncrona
      sync_install = false,

      -- Instala automáticamente parsers faltantes
      auto_install = true,

      -- Configuración de resaltado
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}

