{
  description = "pspiagicw's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      falcon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/falcon/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.pspiagicw = import ./systems/falcon/home.nix;
          }
        ];
      };
      starship = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/starship/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.pratham = import ./systems/starship/home.nix;
          }
        ];
      };
    };
  };
}
