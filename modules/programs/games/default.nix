{ pkgs, opts, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    xpadneo.enable = true;
  };
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      gamescopeSession.steamArgs = [ "-tenfoot" ]; # -pipewire-dmabuf
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };
  environment.systemPackages = with pkgs; [ steam-run ];
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        prismlauncher
        osu-lazer
      ];
    })
  ];
}
