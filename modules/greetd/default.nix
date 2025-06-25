{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --theme 'border=blue;text=white;prompt=cyan;time=yellow;action=white;button=red;container=black;input=white' --cmd Hyprland";
        user = "greeter";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    pkgs.greetd.tuigreet
  ];
}
