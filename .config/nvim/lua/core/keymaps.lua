-- Горячие клавиши (keymaps)
local keymap = vim.keymap.set

-- Leader клавиша (по умолчанию \)
vim.g.mapleader = " " -- Устанавливаем пробел как leader клавишу

-- Навигация по вкладкам (буферам)
-- Tab - следующая вкладка
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", {
	desc = "Next buffer",
	silent = true,
})

-- Shift+Tab - предыдущая вкладка
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {
	desc = "Previous buffer",
	silent = true,
})

-- <leader>x - закрыть текущую вкладку
keymap("n", "<leader>x", ":bdelete<CR>", {
	desc = "Close buffer",
	silent = true,
})

-- <leader>X - закрыть все вкладки кроме текущей
keymap("n", "<leader>X", ":BufferLineCloseOthers<CR>", {
	desc = "Close other buffers",
	silent = true,
})

-- Сохранять выделение после сдвига отступа (< и >)
keymap("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Git restore текущего файла
keymap("n", "<leader>gr", function()
	local file = vim.fn.expand("%:p")
	local cmd = "git restore " .. vim.fn.shellescape(file)
	local result = vim.fn.system(cmd)

	if vim.v.shell_error == 0 then
		vim.cmd("edit!") -- Перечитать файл
		print("✓ Git restore: " .. vim.fn.expand("%:t"))
	else
		print("✗ Git restore failed: " .. result)
	end
end, { desc = "Git restore current file" })
