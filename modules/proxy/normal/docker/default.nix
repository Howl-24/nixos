{ pkgs, ... }:
{
  systemd.services = {
    xray = {
      enable = true;
      description = "xray";
      after = [
        "network.target"
        "docker.service"
      ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        Restart = "on-abort";
        ExecStart = "${pkgs.xray}/bin/xray -c ${./config.json}";
      };
    };
  };
}
