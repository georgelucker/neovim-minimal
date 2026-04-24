  -- Treesitter: парсинг файлов для подсветки и контекста

  return {
      {
          "nvim-treesitter/nvim-treesitter",
          build = ":TSUpdate", -- Обновлять парсеры при обновлении плагина
          config = function()
              require("nvim-treesitter.configs").setup({
                  -- Устанавливаем парсеры для нужных языков
                  ensure_installed = { "yaml" },

                  -- Автоматически устанавливать недостающие парсеры
                  auto_install = true,

                  -- Подсветка синтаксиса через treesitter
                  highlight = {
                      enable = true,
                  },
              })
          end,
      },
      {
          "nvim-treesitter/nvim-treesitter-context",
          config = function()
              require("treesitter-context").setup({
                  -- Максимум строк контекста вверху экрана
                  max_lines = 4,
              })
          end,
      },
  }
