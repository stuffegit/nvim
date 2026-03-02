#!/usr/bin/env bash

set -e

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  build-essential \
  cmake \
  make \
  ninja-build \
  pkg-config

sudo apt install -y clang clangd clang-tidy

sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim

sudo apt install -y \
  curl \
  unzip \
  ripgrep \
  fd-find \
  git

if ! command -v fd >/dev/null 2>&1; then
  sudo ln -s $(which fdfind) /usr/local/bin/fd || true
fi

echo "Versions installed:"
nvim --version | head -n 1
clang --version | head -n 1
clangd --version | head -n 1
cmake --version | head -n 1
