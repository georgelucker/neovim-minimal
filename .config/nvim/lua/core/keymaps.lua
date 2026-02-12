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
