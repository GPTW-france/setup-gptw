#!/usr/bin/env bash
set -e

sudo apt -y install wget gnupg2 gnupg-agent dirmngr cryptsetup scdaemon pcscd secure-delete hopenpgp-tools yubikey-personalization yubioath-desktop libssl-dev swig libpcsclite-dev libpam-u2f docker.io curl

sh <(curl -L https://nixos.org/nix/install) --daemon

