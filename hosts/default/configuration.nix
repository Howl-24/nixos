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

    # ../../modules/system/blueman
    ../../modules/system/disks
    # ../../modules/system/flatpak
    # ../../modules/system/fonts
    ../../modules/system/garbage-collection
    ../../modules/system/gpu/${opts.gpu}
    # ../../modules/system/greetd
    # ../../modules/system/impermanence
    # ../../modules/system/libvirtd
    # ../../modules/system/pipewire
    ../../modules/system/proxy
    # ../../modules/system/snapper

    # ../../modules/desktop/hyprland
    # ../../modules/desktop/themes/catppuccin

    ../../modules/programs/btop
    # ../../modules/programs/cava
    # ../../modules/programs/discord
    ../../modules/programs/eza
    # ../../modules/programs/fastfetch
    # ../../modules/programs/firefox
    # ../../modules/programs/firejail
    ../../modules/programs/fzf
    # ../../modules/programs/games
    ../../modules/programs/git
    # ../../modules/programs/kitty
    # ../../modules/programs/lazygit
    # ../../modules/programs/localsend
    # ../../modules/programs/mpv
    ../../modules/programs/nixvim
    # ../../modules/programs/obs-studio
    # ../../modules/programs/spicetify
    # ../../modules/programs/spotify-player
    # ../../modules/programs/ssh
    # ../../modules/programs/thunderbird
    # ../../modules/programs/tmux
    # ../../modules/programs/vscode
    ../../modules/programs/yazi
    ../../modules/programs/zoxide
    ../../modules/programs/zsh

    # ../../modules/scripts
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
