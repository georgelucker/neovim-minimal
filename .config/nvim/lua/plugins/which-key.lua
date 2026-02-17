-- Подсказки для горячих клавиш (which-key)

return {
	"folke/which-key.nvim",
	event = "VeryLazy", -- Загружать не сразу, а после старта
	config = function()
		local wk = require("which-key")

		wk.setup({
			delay = 300, -- Задержка перед появлением подсказки (мс)
		})

		-- Группы биндов (описания для префиксов)
		wk.add({
			{ "<leader>t", group = "theme" }, -- Группа для переключения тем
			{ "<leader>x", group = "buffer" }, -- Группа для управления буферами
			{ "<leader>g", group = "git" },
		})
	end,
}
