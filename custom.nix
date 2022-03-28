{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./gpg.nix
    ./vim.nix
    ./bash.nix
    ./terminator.nix
#    ./fish.nix
  ];
  home = {

    packages = with pkgs; [
      terminator
      direnv
      fish
      thefuck
      peco
      powerline-fonts
      fzf
      gnupg
    ];
  };
}
