#!/usr/bin/env bash
set -e

sh <(curl -L https://nixos.org/nix/install) --daemon

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

CONFIG_FILE=$HOME/.config/nixpkgs/home.nix

cp home.nix $CONFIG_FILE

sed -i s@\$HOME@\"$HOME\"@g $CONFIG_FILE
sed -i s@\$USER@\"$USER\"@g $CONFIG_FILE

home-manager switch

sudo apt -y install wget gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools yubikey-personalization libssl-dev swig libpcsclite-dev
