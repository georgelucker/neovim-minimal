-- Автоматическая работа с SOPS-зашифрованными файлами (nvim-sops)

return {
	"prismatic-koi/nvim-sops",
	event = { "BufEnter" },
	keys = {
		-- Горячие клавиши для шифрования/расшифровки
		{ "<leader>ef", vim.cmd.SopsEncrypt, desc = "Encrypt File" },
		{ "<leader>df", vim.cmd.SopsDecrypt, desc = "Decrypt File" },
	},
	config = function()
		-- Устанавливаем переменную окружения перед запуском плагина
		vim.env.SOPS_AGE_KEY_FILE = vim.fn.expand("~/.config/sops/age/keys.txt")

		require("nvim_sops").setup({
			enabled = true,
			debug = true, -- Включаем отладку
			binPath = "sops",
		})
	end,
}
