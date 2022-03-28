{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./custom.nix
  ];

  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = $USER;
    homeDirectory = $HOME;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";


    # Packages that should be installed to the user profile.
    packages = with pkgs; [
          git
          virt-manager
          vim
    ];
  };
} 
