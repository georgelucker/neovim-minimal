-- Автоматическая работа с SOPS-зашифрованными файлами

return {
	"Glench/vim-sops",
	lazy = false,
	init = function()
		-- Указываем путь к age ключу
		vim.env.SOPS_AGE_KEY_FILE = vim.fn.expand("~/.config/sops/age/keys.txt")
	end,
}
