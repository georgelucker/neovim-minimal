-- Базовые настройки Neovim

local opt = vim.opt

-- Нумерация строк
opt.number = true -- Показывать номера строк
opt.relativenumber = true -- Относительная нумерация

-- Табуляция и отступы
opt.tabstop = 4 -- Ширина табуляции = 4 пробела
opt.shiftwidth = 4 -- Ширина отступа = 4 пробела
opt.expandtab = true -- Преобразовывать табы в пробелы
opt.autoindent = true -- Автоматический отступ

-- Поиск
opt.ignorecase = true -- Игнорировать регистр при поиске
opt.smartcase = true -- Учитывать регистр если есть заглавные буквы

-- Внешний вид
opt.termguicolors = true -- Включить 24-bit RGB цвета
opt.cursorline = true -- Подсветка текущей строки
opt.signcolumn = "yes" -- Всегда показывать колонку для знаков (git, ошибки)

-- Разное
opt.mouse = "a" -- Включить мышь
opt.swapfile = false -- Не создавать swap файлы
