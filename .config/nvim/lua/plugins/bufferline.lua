-- Конфигурация bufferline (вкладки открытых файлов)

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons", -- Иконки для файлов
	config = function()
		require("bufferline").setup({
			options = {
				-- Режим отображения: "buffers" показывает буферы как вкладки
				mode = "buffers",

				-- для отображения вкладок не над neo-tree, а над полем ввода текста
				offsets = { -- ← ДОБАВИТЬ ЭТУ СЕКЦИЮ
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				}, -- ← ДО СЮДА

				-- Показывать номера вкладок
				numbers = "none", -- Варианты: "none", "ordinal", "buffer_id", "both"

				-- Кнопка закрытия вкладки
				close_command = function(bufnum)
					-- Если это последний буфер, создаём пустой перед закрытием
					local buffers = vim.fn.getbufinfo({ buflisted = 1 })
					if #buffers <= 1 then
						vim.cmd("enew") -- Создать новый пустой буфер
					end
					vim.cmd("bdelete! " .. bufnum)
				end,
				right_mouse_command = function(bufnum)
					-- Если это последний буфер, создаём пустой перед закрытием
					local buffers = vim.fn.getbufinfo({ buflisted = 1 })
					if #buffers <= 1 then
						vim.cmd("enew") -- Создать новый пустой буфер
					end
					vim.cmd("bdelete! " .. bufnum)
				end,

				-- Индикатор для текущей вкладки
				indicator = {
					style = "underline", -- Подчеркивание активной вкладки
				},

				-- Показывать кнопку закрытия на вкладках
				show_buffer_close_icons = true,
				show_close_icon = false, -- Не показывать общую кнопку закрытия справа

				-- Разделитель между вкладками
				separator_style = "thin", -- Варианты: "slant", "thick", "thin", "padded_slant"

				-- Показывать вкладки только если их больше одной (true - видеть всегда)
				always_show_bufferline = true,

				-- Диагностика (ошибки, предупреждения)
				diagnostics = false, -- Можно включить "nvim_lsp" если будет LSP
			},
		})
	end,
}
