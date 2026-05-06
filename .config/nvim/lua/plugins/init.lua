-- Менеджер плагинов lazy.nvim
-- Автоматическая установка lazy.nvim если его нет

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Проверяем установлен ли lazy.nvim
if not vim.loop.fs_stat(lazypath) then
	-- Если нет - клонируем его из GitHub
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- Используем стабильную версию
		lazypath,
	})
end

-- Добавляем lazy.nvim в runtime path
vim.opt.rtp:prepend(lazypath)

-- Загружаем плагины из отдельных файлов
require("lazy").setup({
	-- Импортируем конфигурации плагинов из папки plugins
	{ import = "plugins.neo-tree" },
	{ import = "plugins.theme" },
	{ import = "plugins.bufferline" },
	{ import = "plugins.cmp" },
	{ import = "plugins.which-key" },
	{ import = "plugins.toggleterm" },
	{ import = "plugins.sops" },
    -- { import = "plugins.treesitter" },
})
