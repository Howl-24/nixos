{ ... }:
{
  nix = {
    gc.automatic = true;
    gc.persistent = true;
    gc.dates = "weekly";
    optimise.automatic = true;
    optimise.persistent = true;
    optimise.dates = "weekly";
  };
  home-manager.sharedModules = [
    (_: {
      nix.gc.automatic = true;
      nix.gc.persistent = true;
      nix.gc.frequency = "weekly";
    })
  ];
}
