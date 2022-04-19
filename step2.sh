#!/usr/bin/env bash
set -e

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

CONFIG_FILE=$HOME/.config/nixpkgs/home.nix

cp *.nix $HOME/.config/nixpkgs/

sed -i s@\$HOME@\"$HOME\"@g $CONFIG_FILE
sed -i s@\$USER@\"$USER\"@g $CONFIG_FILE

home-manager switch


sudo usermod -aG docker $USER

sudo ufw enable

