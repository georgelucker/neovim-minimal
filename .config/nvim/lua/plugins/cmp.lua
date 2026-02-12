-- Конфигурация nvim-cmp (автодополнение)

return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path", -- Автодополнение путей к файлам
		"hrsh7th/cmp-buffer", -- Автодополнение из текущего буфера
		"hrsh7th/cmp-cmdline", -- Автодополнение в командной строке
	},
	config = function()
		local cmp = require("cmp")

		-- Настройка автодополнения для обычного режима (insert mode)
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- Enter - подтвердить выбор
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Ctrl+Space - вызвать автодополнение вручную
				["<C-Space>"] = cmp.mapping.complete(),

				-- Ctrl+e - закрыть окно автодополнения
				["<C-e>"] = cmp.mapping.abort(),

				-- Tab - следующий вариант
				["<Tab>"] = cmp.mapping.select_next_item(),

				-- Shift+Tab - предыдущий вариант
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
			}),

			-- Источники автодополнения
			sources = cmp.config.sources({
				{ name = "path" }, -- Пути к файлам
				{ name = "buffer" }, -- Слова из текущего файла
			}),
		})

		-- Автодополнение в командной строке (при вводе :)
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" }, -- Пути к файлам
				{ name = "cmdline" }, -- Vim команды
			}),
		})

		-- Автодополнение при поиске (при вводе /)
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" }, -- Поиск по словам в файле
			},
		})
	end,
}
