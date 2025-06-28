# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  opts,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common.nix

    # ../../modules/blueman
    # ../../modules/btop
    # ../../modules/cava
    # ../../modules/docker
    # ../../modules/direnv
    # ../../modules/discord
    ../../modules/disks
    ../../modules/eza
    # ../../modules/fastfetch
    # ../../modules/firefox
    # ../../modules/firejail
    # ../../modules/flatpak
    # ../../modules/fonts
    ../../modules/fzf
    # ../../modules/games
    ../../modules/garbage-collection
    # ../../modules/gimp
    ../../modules/git
    ../../modules/gpu/${opts.gpu}
    # ../../modules/greetd
    # ../../modules/impermanence
    # ../../modules/imv
    # ../../modules/jellyfin
    # ../../modules/kitty
    # ../../modules/lazygit
    # ../../modules/libreoffice
    # ../../modules/libvirtd
    # ../../modules/localsend
    # ../../modules/mpv
    ../../modules/nixvim
    # ../../modules/obs-studio
    # ../../modules/pipewire
    # ../../modules/productivity
    ../../modules/proxy/tproxy/default
    # ../../modules/rice
    # ../../modules/samba
    ../../modules/scripts/system
    ../../modules/scripts/user
    # ../../modules/snapper
    # ../../modules/spicetify
    # ../../modules/spotify-player
    # ../../modules/ssh
    # ../../modules/thunderbird
    # ../../modules/tmux
    ../../modules/utilities
    # ../../modules/vscode
    ../../modules/yazi
    # ../../modules/zathura
    ../../modules/zoxide
    ../../modules/zsh

    # ../../modules/desktop/hyprland
    # ../../modules/desktop/themes/catppuccin
  ];

  # Define system packages here
  environment.systemPackages = with pkgs; [ ];

  # Home-manager config
  home-manager.sharedModules = [ (_: { home.packages = with pkgs; [ ]; }) ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
