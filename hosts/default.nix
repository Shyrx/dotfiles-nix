inputs@{ self, home-manager, nixpkgs, system, ... }:

{
  config = hostName:
    nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/configuration.nix
        ./hosts/nixos/hardware-configuration.nix

        { networking.hostName = "nixos"; }

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.shyrx = import ./hosts/home.nix;
          };
        }
      ];
    };
}
