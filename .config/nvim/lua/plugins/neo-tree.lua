-- Конфигурация neo-tree (файловый менеджер)

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	-- Зависимости neo-tree
	dependencies = {
		"nvim-lua/plenary.nvim", -- Библиотека полезных функций
		"nvim-tree/nvim-web-devicons", -- Иконки файлов
		"MunifTanjim/nui.nvim", -- UI компоненты
	},
	config = function()
		-- Настройки neo-tree
		require("neo-tree").setup({
			-- Закрывать neo-tree при открытии файла
			close_if_last_window = true,

			-- Настройки окна
			window = {
				width = 30, -- Ширина окна neo-tree
				mappings = {
					-- Горячие клавиши внутри neo-tree
					["<space>"] = "none", -- Отключаем пробел (будет использоваться как leader)
				},
			},

			-- Настройки файловой системы
			filesystem = {
				-- Следовать за текущим файлом
				follow_current_file = {
					enabled = true, -- Автоматически показывать текущий файл в дереве
				},
				-- Использовать системные команды для операций с файлами
				use_libuv_file_watcher = true,
			},
		})

		-- Горячая клавиша для открытия/закрытия neo-tree
		-- <leader>e - переключить neo-tree
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {
			desc = "Toggle Neo-tree",
			silent = true,
		})
	end,
}
