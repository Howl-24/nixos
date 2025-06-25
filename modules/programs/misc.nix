{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ ];
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        unzip
        ffmpeg
        # mediainfo
        # glow
        # jq
        # gcc
        # nixfmt
        cmatrix
        tty-clock
        cbonsai
      ];
    })
  ];
}
