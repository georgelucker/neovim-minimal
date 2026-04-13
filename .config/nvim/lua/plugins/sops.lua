-- SOPS без плагина - расшифровка только в буфере

return {
	dir = vim.fn.stdpath("config"),
	name = "sops-buffer-only",
	lazy = false,
	config = function()
		vim.env.SOPS_AGE_KEY_FILE = vim.fn.expand("~/.config/sops/age/keys.txt")

		local sops_au = vim.api.nvim_create_augroup("SopsBuffer", { clear = true })

		-- Расшифровка при открытии - только в буфер, не на диск
		vim.api.nvim_create_autocmd("BufReadPost", {
			group = sops_au,
			pattern = "*.sops.*",
			callback = function()
				local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, 10, false), "\n")
				if content:match("sops:") or content:match("ENC%[") then
					local file = vim.fn.expand("%:p")
					local dec = vim.fn.system("sops -d " .. vim.fn.shellescape(file))
					if vim.v.shell_error == 0 then
						vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(dec, "\n"))
						vim.bo.modified = false
						vim.b.sops_enc = true
					end
				end
			end,
		})

		-- Полная замена команды сохранения для SOPS файлов
		vim.api.nvim_create_autocmd("BufWriteCmd", {
			group = sops_au,
			pattern = "*.sops.*",
			callback = function()
				if vim.b.sops_enc then
					local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
					local file = vim.fn.expand("%:p")
					local tmp = vim.fn.tempname()

					-- Записываем расшифрованное содержимое во временный файл
					vim.fn.writefile(lines, tmp)

					-- Зашифровываем и сохраняем
					local result =
						vim.fn.system("sops -e " .. vim.fn.shellescape(tmp) .. " > " .. vim.fn.shellescape(file))
					os.remove(tmp)

					if vim.v.shell_error == 0 then
						-- Отмечаем буфер как сохранённый
						vim.bo.modified = false
						print("🔒 SOPS file encrypted and saved")

						-- Перечитываем файл (расшифрованный в буфер)
						local dec = vim.fn.system("sops -d " .. vim.fn.shellescape(file))
						if vim.v.shell_error == 0 then
							vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(dec, "\n"))
							vim.bo.modified = false
						end
					else
						print("❌ Failed to encrypt SOPS file")
					end
				else
					-- Обычное сохранение для не-SOPS файлов
					vim.cmd("write!")
				end
			end,
		})
	end,
}
