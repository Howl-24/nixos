{ inputs, pkgs, lib, opts, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Filesystems support
  boot.supportedFilesystems = [ "ntfs" "exfat" "ext4" "fat32" "btrfs" ];
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Bootloader.
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelModules = lib.optional opts.virtual "kvm";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir
          "share/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf" ''
            bluetooth.autoswitch-to-headset-profile = false
          '')
      ];
    };
  };

  # Set your time zone.
  time.timeZone = opts.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = opts.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = opts.locale;
    LC_IDENTIFICATION = opts.locale;
    LC_MEASUREMENT = opts.locale;
    LC_MONETARY = opts.locale;
    LC_NAME = opts.locale;
    LC_NUMERIC = opts.locale;
    LC_PAPER = opts.locale;
    LC_TELEPHONE = opts.locale;
    LC_TIME = opts.locale;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = opts.kbdLayout;
    variant = opts.kbdVariant;
  };

  console.keyMap = opts.consoleKeymap; # Configure console keymap

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [ wget vim ] ++ lib.optional opts.proxy xray;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    mutableUsers = false;
    users = {
      root.initialHashedPassword = opts.rootpasswd;
      ${opts.username} = {
        initialHashedPassword = opts.userpasswd;
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ]
          ++ lib.optional opts.virtual "libvirtd";
      };
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.howl = { pkgs, ... }: {
      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;

      xdg.enable = true;
      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ];
        xdgOpenUsePortal = true;
      };

      home.username = opts.username;
      home.homeDirectory = "/home/${opts.username}";
      home.stateVersion = "25.05"; # Please read the comment before changing.
      home.sessionVariables = {
        TERMINAL = opts.terminal;
        EDITOR = opts.editor;
        BROWSER = opts.browser;
      };

      # Packages that don't require configuration. If you're looking to configure a program see the /modules dir
      home.packages = with pkgs; [ ];
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # Automatic clean garbage
  nix = {
    gc.automatic = true;
    gc.dates = "weekly";
    optimise.automatic = true;
    optimise.dates = "weekly";
  };
  home-manager.sharedModules = [
    (_: {
      nix.gc.automatic = true;
      nix.gc.frequency = "weekly";
    })
  ];
}
