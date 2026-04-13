-- Конфигурация для работы с SOPS-зашифрованными файлами

return {
	"lucidph3nx/nvim-sops",
	event = "VeryLazy", -- Загружать не сразу
	config = function()
		require("sops").setup({
			-- Автоматически расшифровывать файлы при открытии
			enabled = true,

			-- Команда для расшифровки (sops использует age из .sops.yaml автоматически)
			-- SOPS ищет ключи в ~/.config/sops/age/keys.txt
			decrypt_cmd = "sops --decrypt %s",

			-- Команда для зашифровки обратно при сохранении
			encrypt_cmd = "sops --encrypt %s",

			-- Паттерны файлов для автоматической обработки
			-- Соответствует вашему path_regex: .*\.ya?ml?$
			file_patterns = {
				"*.yaml",
				"*.yml",
			},

			-- Показывать уведомления о расшифровке/зашифровке
			show_notifications = true,
		})
	end,
}
