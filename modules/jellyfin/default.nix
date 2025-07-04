{ pkgs, opts, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "${opts.username}";
  };
  systemd.services.jellyfin = {
    serviceConfig = {
      Environment = [
        "http_proxy=http://127.0.0.1:9998"
        "https_proxy=http://127.0.0.1:9998"
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
