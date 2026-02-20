#!/bin/bash

# Скрипт для установки Neovim из официального бинарника
# Запускать с sudo для установки в /opt

set -e # Прерывать выполнение при ошибке

# Проверка на запуск от root
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите скрипт с sudo:"
  echo "sudo $0"
  exit 1
fi

echo "📥 Скачивание последней версии Neovim..."
wget -q --show-progress https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz -O /tmp/nvim-linux-x86_64.tar.gz

echo "📦 Распаковка в /opt..."
tar -C /opt -xzf /tmp/nvim-linux-x86_64.tar.gz

echo "🔗 Создание символической ссылки..."
ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

echo "🧹 Очистка временных файлов..."
rm /tmp/nvim-linux-x86_64.tar.gz

echo "✅ Установка завершена!"
echo "Версия установленного Neovim:"
nvim --version | head -n 1
