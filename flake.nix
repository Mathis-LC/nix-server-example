{
  description = "Add a description to your flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      settings = import ./settings.nix;
    in
    {
      nixConfig = {
        extra-experimental-features = [ "nix-command" "flakes" ];
      };

      nixosConfigurations = {
        host = nixpkgs.lib.nixosSystem {
          system = settings.SYSTEM;
          modules = [
            ./host/configuration.nix
            home-manager.nixosModules.home-manager
          ];
          specialArgs = {
            inherit self inputs settings;
          };
        };
      };
    };
}