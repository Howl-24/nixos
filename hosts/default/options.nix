{
  hostname = "nixos";
  rootpasswd =
    "$6$1bNtqKFsObhMC1OG$THnog0HqmR/GnN.0IwndZzuijVMiV0cZIPUjmCvDs6gsjHAc.FYfcIlKmiMx2hy2gbd814Br1uNAhiyKl4W9g.";
  gpu = "nvidia";
  locale = "en_US.UTF-8";
  timezone = "Asia/Shanghai";
  kbdLayout = "us";
  kbdVariant = "";
  consoleKeymap = "us";

  username = "howl";
  userpasswd =
    "$6$.FVrKngH1eXjNYi9$lsTAUQvvJyB209fhkf3g5E12iCcgNdDZKW0XTwCp7i3lNwM8gjNq3kRgjW4WIBV68YETysoDCHhKtSIncPT3n1";
  editor = "nvim";
  terminal = "kitty";
  terminalFileManager = "yazi";
  browser = "firefox";
  emailClient = "thunderbird";

  hyprland = {
    monitor = [ ];
    workspaceBind = "";
    wallpaper = "black.png";
  };

  hyprlock = {
    monitor1 = "";
    monitor2 = "";
    background1 = "horizontal/mocha/greenbus.jpg";
    background2 = "vertical/anime/76257949_p0.jpg";
  };

  git = {
    userName = "howl";
    userEmail = "howell.ding@outlook.com";
  };

  openssh.enable = true;
}
