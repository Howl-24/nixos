{ pkgs, ... }: {
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        unzip
        zoxide
        eza
        fzf
        ffmpeg
        mediainfo
        glow
        jq
        gcc
        cmatrix
        tty-clock
        cbonsai
      ];
    })
  ];
}
