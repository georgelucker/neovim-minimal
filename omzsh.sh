#!/bin/bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sleep 2

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="clean"/' ~/.zshrc
