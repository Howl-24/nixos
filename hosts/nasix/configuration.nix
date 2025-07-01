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
    ../../modules/cron
    ../../modules/docker
    # ../../modules/direnv
    # ../../modules/discord
    ../../modules/disks
    ../../modules/eza
    ../../modules/fastfetch
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
    ../../modules/jellyfin
    # ../../modules/kitty
    # ../../modules/lazygit
    # ../../modules/libreoffice
    # ../../modules/libvirtd
    # ../../modules/localsend
    # ../../modules/mpv
    ../../modules/nixvim
    # ../../modules/obs-studio
    # ../../modules/pipewire
    ../../modules/proxy/normal/docker
    ../../modules/rice
    ../../modules/samba
    ../../modules/scripts/system
    ../../modules/scripts/user
    # ../../modules/snapper
    # ../../modules/spicetify
    # ../../modules/spotify-player
    # ../../modules/ssh
    # ../../modules/thunderbird
    # ../../modules/tmux
    # ../../modules/vscode
    ../../modules/yazi
    # ../../modules/zathura
    ../../modules/zoxide
    ../../modules/zsh

    # ../../modules/desktop/hyprland
    # ../../modules/desktop/themes/catppuccin
  ];

  # Define system packages here
  environment.systemPackages = with pkgs; [ iptables ];

  # Home-manager config
  home-manager.sharedModules = [ (_: { home.packages = with pkgs; [ ]; }) ];

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest; # _latest, _zen, _xanmod_latest, _hardened, _rt, _OTHER_CHANNEL, etc.

  hardware.nvidia.prime = {
    # Make sure to use the correct Bus ID values for your system!
    nvidiaBusId = "PCI:01:0:0";
    amdgpuBusId = "PCI:07:0:0";
  };

  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/d850efcf-11d2-4a43-9a13-a61d362e1cd3";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
    neededForBoot = false;
  };

  fileSystems."/mnt/smb" = {
    device = "/dev/disk/by-uuid/04CEA1884141A7D0";
    fsType = "ntfs-3g";
    options = [
      "uid=1000"
      "gid=100"
      "dmask=0000"
      "fmask=0000"
      "exec"
    ];
    neededForBoot = false;
  };

  services.frp = {
    enable = true;
    role = "client";
    settings = {
      serverAddr = "144.168.60.188";
      serverPort = 20000;
      auth.token = "hVuywt2SYnpUyEdUixinVNOHbODjJDfm2K6kxnz9WRroa515j2RAqtaP6RUhXIOPMyq9Sopq0avgb4w9VxPJd3PWbBqKcB2AtYmwPc2A0KDgsc78IjLzHqoOHL";
      transport.tls.trustedCaFile = "/etc/frp/cert/ca.crt";
      transport.tls.certFile = "/etc/frp/cert/client.crt";
      transport.tls.keyFile = "/etc/frp/cert/client.key";

      proxies = [
        {
          name = "ssh";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 22;
          remotePort = 22222;
        }
        {
          name = "jellyfin";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 8096;
          remotePort = 8096;
        }
        {
          name = "homepage";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10000;
          remotePort = 10000;
        }
        {
          name = "calibre";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10100;
          remotePort = 10100;
        }
        {
          name = "freshrss";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10110;
          remotePort = 10110;
        }
        {
          name = "rsshub";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10120;
          remotePort = 10120;
        }
        {
          name = "qbittorrent";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10200;
          remotePort = 10200;
        }
        {
          name = "peerbanhelper";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10225;
          remotePort = 10225;
        }
        {
          name = "anirss";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10230;
          remotePort = 10230;
        }
        {
          name = "autobangumi";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10240;
          remotePort = 10240;
        }
        {
          name = "moviepilot";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10250;
          remotePort = 10250;
        }
        {
          name = "vaultwarden";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10300;
          remotePort = 10300;
        }
        {
          name = "linkding";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10310;
          remotePort = 10310;
        }
        {
          name = "notemark";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10320;
          remotePort = 10320;
        }
        {
          name = "drawio";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10330;
          remotePort = 10330;
        }
        {
          name = "speedtest";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 10400;
          remotePort = 10400;
        }
        {
          name = "glances";
          type = "tcp";
          localIP = "127.0.0.1";
          localPort = 61208;
          remotePort = 61208;
        }
      ];
    };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    9997
    9998
    9999
    10000
    10090
    10100
    10110
    10120
    10200
    10225
    10230
    10240
    10250
    10300
    10310
    10320
    10330
    10400
    61208
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
