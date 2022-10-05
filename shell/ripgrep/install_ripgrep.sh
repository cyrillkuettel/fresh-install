#!/bin/bash
# Installs ripgrep without requiring root and creates an alias in .zshrc

curl -LO 'https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz'
tar xf ripgrep-13.0.0-*.tar.gz
mkdir -p $HOME/bin
cp ripgrep-13.0.0-x86_64-unknown-linux-musl/rg $HOME/bin/rg
echo "alias 'rg'=~/bin/rg" >> ~/.zshrc
