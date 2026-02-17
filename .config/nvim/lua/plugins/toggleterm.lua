-- Конфигурация toggleterm (терминал внутри neovim)

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			-- Размер терминала
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
		})

		-- Lazygit в плавающем окне
		local lazygit = require("toggleterm.terminal").Terminal:new({
			cmd = "lazygit", -- Команда для запуска
			direction = "float", -- Плавающее окно
			hidden = true, -- Скрывать когда не используется
			float_opts = {
				border = "curved", -- Скруглённые границы окна
			},
		})

		-- Функция переключения lazygit
		vim.keymap.set("n", "<leader>gG", function()
			lazygit:toggle()
		end, { desc = "Lazygit", silent = true })
	end,
}
