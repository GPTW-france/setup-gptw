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

for i in $(seq 1 9)
do
    gsettings set org.gnome.shell.keybindings switch-to-application-${i} [];
    gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-${i} [];
    gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-${i} [];
    gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-${i} [];
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-${i} ["'<Super>${i}'"];
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-${i} ["'<Super><Shift>${i}'"];
done

gsettings set org.gnome.shell.keybindings switch-to-application-10 [];
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 [];
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 [];
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 [];
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-10 ["'<Super>0'"];
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-10 ["'<Super><Shift>0'"];
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 10
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"

sudo usermod -aG docker $USER
