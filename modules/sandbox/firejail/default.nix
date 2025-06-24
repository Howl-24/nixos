{ pkgs, ... }: {
  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      # qq = {
      #   executable = "${pkgs.qq}/bin/qq";
      #   profile = "/etc/firejail/qq.profile";
      #   extraArgs = [ "--private" ];
      # };
      # wechat = {
      #   executable = "${pkgs.wechat}/bin/wechat";
      #   profile = "/etc/firejail/wechat.profile";
      #   extraArgs = [ "--private" ];
      # };
    };
  };
  # environment.etc."/firejail/qq.profile".source = ./qq.profile;
  # environment.systemPackages = [ pkgs.qq pkgs.wechat ];
}
