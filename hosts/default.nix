{ lib, inputs, nixpkgs, home-manager, user, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  vm-test = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user;
    };
    modules = [
      ./vm-test
      ./configuration.nix
      inputs.stylix.nixosModules.stylix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
        };
        home-manager.users.${user} = {
          imports = 
            [(import ./vm-test/home.nix)];
        };
      }
    ];
  };
}
