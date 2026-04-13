-- Автоматическая работа с SOPS-зашифрованными файлами (nvim-sops)

return {
	"prismatic-koi/nvim-sops",
	event = { "BufEnter" },
	keys = {
		-- Горячие клавиши для шифрования/расшифровки
		{ "<leader>ef", vim.cmd.SopsEncrypt, desc = "Encrypt File" },
		{ "<leader>df", vim.cmd.SopsDecrypt, desc = "Decrypt File" },
	},
	opts = {
		-- Включить плагин
		enabled = true,

		-- Отладка (показывать больше информации)
		debug = false,

		-- Путь к sops (по умолчанию ищет в $PATH)
		binPath = "sops",

		-- Переменные окружения (если нужно переопределить)
		defaults = {
			ageKeyFile = "SOPS_AGE_KEY_FILE", -- ~/.config/sops/age/keys.txt
		},
	},
}
