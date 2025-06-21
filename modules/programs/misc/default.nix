{ pkgs, ... }: {
  home-manager.sharedModules = [
    (_: {
      home.packages = with pkgs; [
        gcc
        unzip
        zoxide
        fzf
        ffmpeg
        jq
        cmatrix
        tty-clock
        cbonsai
      ];
    })
  ];
}
