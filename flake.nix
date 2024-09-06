{
  description = "My Personal NixOS System Flake Configuration";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      stylix.url = "github:danth/stylix";
    };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs:
    let
      user = "geko";
    in
    {
      nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user stylix;
        }
      );
    };
}
