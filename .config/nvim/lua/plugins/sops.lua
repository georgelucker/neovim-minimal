-- Автоматическая работа с SOPS-зашифрованными файлами (nvim-sops)

return {
	"prismatic-koi/nvim-sops",
	event = { "BufEnter" },
	keys = {
		{ "<leader>ef", vim.cmd.SopsEncrypt, desc = "Encrypt File" },
		{ "<leader>df", vim.cmd.SopsDecrypt, desc = "Decrypt File" },
	},
	config = function()
		vim.env.SOPS_AGE_KEY_FILE = vim.fn.expand("~/.config/sops/age/keys.txt")

		require("nvim_sops").setup({
			enabled = true,
			debug = false,
			binPath = "sops",
		})
	end,
}
