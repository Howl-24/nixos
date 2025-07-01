{
  hostname = "dix";
  hostType = "desktop";
  gpu = "nvidia";
  locale = "en_US.UTF-8";
  timezone = "Asia/Shanghai";
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";
  rootpasswd = "$6$1bNtqKFsObhMC1OG$THnog0HqmR/GnN.0IwndZzuijVMiV0cZIPUjmCvDs6gsjHAc.FYfcIlKmiMx2hy2gbd814Br1uNAhiyKl4W9g.";

  username = "howl";
  userpasswd = "$6$.FVrKngH1eXjNYi9$lsTAUQvvJyB209fhkf3g5E12iCcgNdDZKW0XTwCp7i3lNwM8gjNq3kRgjW4WIBV68YETysoDCHhKtSIncPT3n1";
  editor = "nvim";
  terminal = "kitty";
  terminalFileManager = "yazi";
  browser = "firefox";
  emailClient = "thunderbird";

  hyprland = {
    monitor = [
      "desc:SAC G7u Pro 0001, 3840x2160@160, 0x0, 1.5"
      "desc:KOS KOIOS K2718UD 0000000000000, 3840x2160@60, -1440x-600, 1.5, transform, 1"
    ];
    workspaceBind = ''
      workspace = 1, monitor:desc:SAC G7u Pro 0001, default:true;
      workspace = 10, monitor:desc:KOS KOIOS K2718UD 0000000000000, default:true;
    '';
    wallpaper = "universal/black.png";
  };

  hyprlock = {
    monitor1 = "DP-1";
    monitor2 = "HDMI-A-1";
    background1 = "horizontal/mocha/greenbus.jpg";
    background2 = "vertical/anime/76257949_p0.jpg";
  };

  hypridle = {
    time = {
      lock = "300";
      dpmsOff = "";
      suspend = "";
    };
  };

  git = {
    userName = "howl";
    userEmail = "howell.ding@outlook.com";
  };

  openssh.enable = true;
}
