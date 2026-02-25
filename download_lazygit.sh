#!/bin/bash
set -e

LAZYGIT_URL="https://github.com/jesseduffield/lazygit/releases/download/v0.59.0/lazygit_0.59.0_linux_x86_64.tar.gz"
INSTALL_DIR="/opt/lazygit"
ARCHIVE="/tmp/lazygit.tar.gz"

echo "Скачиваем lazygit..."
curl -Lo "$ARCHIVE" "$LAZYGIT_URL"

echo "Создаём директорию $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"

echo "Извлекаем архив..."
tar -xzf "$ARCHIVE" -C "$INSTALL_DIR"

echo "Создаём символическую ссылку..."
ln -sf "$INSTALL_DIR/lazygit" /usr/local/bin/lazygit

echo "Убираем архив..."
rm -f "$ARCHIVE"

echo "Готово! Проверка:"
lazygit --version
