# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, opts, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/hardware/gpu/${opts.gpu}
    # ../../modules/persist

    ../common.nix

    ../../modules/desktop/hyprland
    ../../modules/desktop/themes/catppuccin

    ../../modules/programs/firefox
    ../../modules/programs/kitty
    ../../modules/programs/zsh
    ../../modules/programs/tmux
    ../../modules/programs/yazi
    ../../modules/programs/fzf
    ../../modules/programs/zoxide
    ../../modules/programs/eza
    ../../modules/programs/fastfetch
    ../../modules/programs/git
    ../../modules/programs/lazygit
    ../../modules/programs/btop
    ../../modules/programs/cava
    ../../modules/programs/neovim
    ../../modules/programs/vscode
    ../../modules/programs/ssh
    ../../modules/programs/mpv
    ../../modules/programs/spicetify
    ../../modules/programs/thunderbird
    ../../modules/programs/discord
    ../../modules/programs/obs-studio
    ../../modules/programs/misc.nix

    # ../../modules/games

    ../../modules/sandbox/firejail
    ../../modules/sandbox/flatpak

    # ../../modules/virtual/libvirtd

    ../../modules/scripts

    ../../modules/proxy
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
