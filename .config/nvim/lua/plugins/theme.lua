-- Конфигурация темы Rose Pine Dawn (светлая тема)

return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000, -- Загружать тему первой (высокий приоритет)
	config = function()
		-- Настройки темы
		require("rose-pine").setup({
			-- Вариант темы: dawn (светлая), moon (темная), main (основная темная)
			variant = "dawn",

			-- Стили для разных элементов
			styles = {
				bold = true,
				italic = true,
				transparency = false, -- Прозрачность выключена
			},

			-- Подсветка групп
			highlight_groups = {
				-- Можно добавить кастомные подсветки
			},
		})

		-- Устанавливаем светлый фон
		vim.o.background = "light"

		-- Активируем тему
		vim.cmd([[colorscheme rose-pine]])
	end,
}
