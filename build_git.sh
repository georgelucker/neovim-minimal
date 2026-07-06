#!/bin/bash
# Сборка git из исходников. Проверено на Debian 11
set -e

GIT_VERSION="2.55.0"
GIT_URL="https://github.com/git/git/archive/refs/tags/v${GIT_VERSION}.tar.gz"
BUILD_DIR="/tmp/git-build"
SRC_DIR="${BUILD_DIR}/git-${GIT_VERSION}"
ARCHIVE="/tmp/git.tar.gz"
INSTALL_PREFIX="/usr/local"

echo "Устанавливаем зависимости для сборки..."
apt-get update
apt-get install -y --no-install-recommends \
  build-essential \
  autoconf \
  libcurl4-openssl-dev \
  libssl-dev \
  libexpat1-dev \
  gettext \
  unzip \
  zlib1g-dev \
  asciidoc \
  xmlto \
  docbook2x \
  cargo \
  rustc

echo "Скачиваем исходники Git ${GIT_VERSION}..."
curl -Lo "$ARCHIVE" "$GIT_URL"

echo "Распаковываем..."
mkdir -p "$BUILD_DIR"
tar -xzf "$ARCHIVE" -C "$BUILD_DIR"

echo "Собираем..."
cd "$SRC_DIR"
make configure
./configure --prefix="$INSTALL_PREFIX"
make -j"$(nproc)" all

echo "Устанавливаем..."
make install

echo "Убираем временные файлы..."
rm -rf "$BUILD_DIR" "$ARCHIVE"

echo "Готово! Проверка:"
git --version
