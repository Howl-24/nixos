{ pkgs, ... }: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    xpadneo.enable = true;
  };
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      # gamescopeSession.enable = true;
    };
  };
  home-manager.sharedModules =
    [ (_: { home.packages = with pkgs; [ protonup-qt prismlauncher ]; }) ];
}
