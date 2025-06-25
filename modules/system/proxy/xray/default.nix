{ ... }:
{
  services.xray.enable = true;
  services.xray.settingsFile = ./tproxy.json;
}
