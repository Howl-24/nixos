{ inputs, ... }:
let
  extensions = [
    # Theme
    "${inputs.thunderbird-catppuccin}/themes/mocha/mocha-mauve.xpi"
    # "https://addons.thunderbird.net/thunderbird/downloads/latest/dracula-theme-for-thunderbird/addon-987962-latest.xpi"
    # "https://addons.thunderbird.net/thunderbird/downloads/latest/luminous-matter/addon-988120-latest.xpi"
    # "https://addons.thunderbird.net/thunderbird/downloads/latest/dark-black-theme/addon-988343-latest.xpi"

    # "https://addons.thunderbird.net/thunderbird/downloads/latest/grammar-and-spell-checker/addon-988138-latest.xpi"
    # "https://addons.thunderbird.net/thunderbird/downloads/latest/external-editor-revived/addon-988342-latest.xpi"
  ];
in {
  home-manager.sharedModules = [
    (_: {
      home.file.".thunderbird/default/extensions/{47f5c9df-1d03-5424-ae9e-0613b69a9d2f}.xpi".source =
        ./thunderbird-catppuccin.xpi;
      programs.thunderbird = {
        enable = true;
        profiles."default" = {
          isDefault = true;
          settings = {
            "privacy.donottrackheader.enabled" = true;
            "app.donation.eoy.version.viewed" = 8;
          };
        };
      };
    })
  ];
}
