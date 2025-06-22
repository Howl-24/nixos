{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    nur.url = "github:nix-community/NUR";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      whoami = import ./hosts/whoami.nix;
      hostname = if whoami.hostname != "" then whoami.hostname else "default";
      systemType =
        if whoami.system != "" then whoami.system else "x86_64-linux";
      opts = import ./hosts/${whoami.hostname}/options.nix;
    in {
      nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
        system = systemType;
        specialArgs = { inherit inputs opts; };
        modules = [ ./hosts/${hostname}/configuration.nix ];
      };
    };
}
