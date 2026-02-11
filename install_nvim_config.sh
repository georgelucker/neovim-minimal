#!/bin/bash
echo "Шаг 1: Удаление старой конфигурации Neovim..."
echo "Выполняется: rm -rf ~/.config/nvim"
read -p "Продолжить? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Операция отменена пользователем"
    exit 1
fi
rm -rf ~/.config/nvim

echo "Шаг 2: Копирование новой конфигурации..."
echo "Выполняется: cp -r ./.config/nvim ~/.config/"
cp -r ./.config/nvim ~/.config/
