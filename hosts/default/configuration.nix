# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, opts, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/hardware/gpu/${opts.gpu}

    ../common.nix

    ../../modules/desktop/hyprland

    ../../modules/programs/browser/firefox
    ../../modules/programs/terminal/kitty
    ../../modules/programs/shell/zsh
    ../../modules/programs/cli/tmux
    ../../modules/programs/cli/yazi
    ../../modules/programs/cli/zoxide
    ../../modules/programs/cli/eza
    ../../modules/programs/cli/fastfetch
    ../../modules/programs/cli/git
    ../../modules/programs/cli/lazygit
    ../../modules/programs/cli/btop
    ../../modules/programs/cli/cava
    ../../modules/programs/editor/neovim
    ../../modules/programs/editor/vscode
    ../../modules/programs/ssh
    ../../modules/programs/media/mpv
    ../../modules/programs/media/spicetify
    ../../modules/programs/media/thunderbird
    ../../modules/programs/media/discord
    ../../modules/programs/media/obs-studio
    ../../modules/programs/game
    ../../modules/programs/misc
    ../../modules/programs/sandbox/firejail
    ../../modules/programs/sandbox/flatpak

    # ../../modules/scripts

    ../../modules/themes/catppuccin
  ] ++ lib.optional opts.persist ../../modules/persist
    ++ lib.optional opts.proxy ../../modules/programs/proxy
    ++ lib.optional opts.virtual ../../modules/virtual/libvirtd;

  networking.hostName = opts.hostname; # Define your hostname.

  # Home-manager config
  home-manager.sharedModules = [ (_: { home.packages = with pkgs; [ ]; }) ];

  # Define system packages here
  environment.systemPackages = with pkgs; [ ];

  # Snapshots
  services.snapper = {
    configs = {
      home = {
        SUBVOLUME = "/home";
        ALLOW_USERS = [ "${opts.username}" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
      };
      nix = {
        SUBVOLUME = "/nix";
        ALLOW_USERS = [ "${opts.username}" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
      };
    };
    snapshotInterval = "hourly";
    cleanupInterval = "1d";
  };

  # Disks
  systemd.tmpfiles.rules = [
    "d /mnt/ssd 0775 howl users -"
    "d /mnt/hdd1 0775 howl users -"
    "d /mnt/hdd2 0775 howl users -"
  ];

  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/CC28EE4576AC5AE3";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "dmask=0022" "fmask=002" "exec" ];
    neededForBoot = false;
  };

  fileSystems."/mnt/hdd1" = {
    device = "/dev/disk/by-uuid/967611C64CDA39CC";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "dmask=0022" "fmask=002" "exec" ];
    neededForBoot = false;
  };

  fileSystems."/mnt/hdd2" = {
    device = "/dev/disk/by-uuid/F0E095F288CE2570";
    fsType = "ntfs-3g";
    options = [ "uid=1000" "gid=100" "dmask=0022" "fmask=002" "exec" ];
    neededForBoot = false;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
