{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    xpadneo.enable = true;
    xone.enable = true;
  };
  services.udev.packages = with pkgs; [ game-devices-udev-rules ];
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession = {
        enable = true;
        steamArgs = [ "-tenfoot" ]; # Default: -tenfoot -pipewire-dmabuf
      };
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        prismlauncher
        osu-lazer
      ];
    })
  ];
}
