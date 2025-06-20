{ pkgs, ... }: {
  home-manager.sharedModules =
    [ (_: { home.packages = with pkgs; [ zoxide fzf unzip gcc ]; }) ];
}
