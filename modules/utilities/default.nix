{ pkgs, ... }:
{
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        ffmpeg
        unzip
      ];
    })
  ];
}
