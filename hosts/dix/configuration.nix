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

    ../../modules/system/blueman
    ../../modules/system/disks
    ../../modules/system/flatpak
    ../../modules/system/fonts
    ../../modules/system/garbage-collection
    ../../modules/system/gpu/${opts.gpu}
    ../../modules/system/greetd
    ../../modules/system/impermanence
    ../../modules/system/libvirtd
    ../../modules/system/pipewire
    ../../modules/system/proxy
    ../../modules/system/snapper

    ../../modules/desktop/hyprland
    ../../modules/desktop/themes/catppuccin

    ../../modules/programs/btop
    ../../modules/programs/cava
    ../../modules/programs/discord
    ../../modules/programs/eza
    ../../modules/programs/fastfetch
    ../../modules/programs/firefox
    ../../modules/programs/firejail
    ../../modules/programs/fzf
    ../../modules/programs/games
    ../../modules/programs/git
    ../../modules/programs/kitty
    ../../modules/programs/lazygit
    ../../modules/programs/localsend
    ../../modules/programs/mpv
    ../../modules/programs/nixvim
    ../../modules/programs/obs-studio
    ../../modules/programs/spicetify
    ../../modules/programs/spotify-player
    ../../modules/programs/ssh
    ../../modules/programs/thunderbird
    ../../modules/programs/tmux
    ../../modules/programs/vscode
    ../../modules/programs/yazi
    ../../modules/programs/zoxide
    ../../modules/programs/zsh

    ../../modules/scripts
  ];

  # Define system packages here
  environment.systemPackages = with pkgs; [ ];

  # Home-manager config
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        cbonsai
        cowsay
        cmatrix
        fortune
        ffmpeg
        figlet
        pipes
        tty-clock
      ];
    })
  ];

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen; # _latest, _zen, _xanmod_latest, _hardened, _rt, _OTHER_CHANNEL, etc.

  # Disks
  systemd.tmpfiles.rules = [
    "d /mnt/ssd 0775 ${opts.username} users -"
    "d /mnt/hdd1 0775 ${opts.username} users -"
    "d /mnt/hdd2 0775 ${opts.username} users -"
  ];

  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/CC28EE4576AC5AE3";
    fsType = "ntfs-3g";
    options = [
      "uid=1000"
      "gid=100"
      "dmask=0022"
      "fmask=002"
      "exec"
    ];
    neededForBoot = false;
  };

  fileSystems."/mnt/hdd1" = {
    device = "/dev/disk/by-uuid/967611C64CDA39CC";
    fsType = "ntfs-3g";
    options = [
      "uid=1000"
      "gid=100"
      "dmask=0022"
      "fmask=002"
      "exec"
    ];
    neededForBoot = false;
  };

  fileSystems."/mnt/hdd2" = {
    device = "/dev/disk/by-uuid/F0E095F288CE2570";
    fsType = "ntfs-3g";
    options = [
      "uid=1000"
      "gid=100"
      "dmask=0022"
      "fmask=002"
      "exec"
    ];
    neededForBoot = false;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
