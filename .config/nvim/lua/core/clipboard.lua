-- Настройка буфера обмена через OSC 52
-- OSC 52 позволяет копировать в системный буфер через SSH/tmux

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		-- Команда для копирования в буфер обмена
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		-- Команда для вставки из буфера обмена
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

-- Включаем unnamedplus, чтобы y/p автоматически работали с системным буфером
-- Теперь обычные y (yank) и p (paste) будут использовать системный буфер обмена
vim.opt.clipboard = "unnamedplus"
