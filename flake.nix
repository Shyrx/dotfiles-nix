{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
    let

      inherit (builtins) attrValues;
      system = "x86_64-linux";

    in rec {

      overlays = { emacs = inputs.emacs-overlay.overlay; };

      nixosModules = {
        modules = import ./modules;

        home.home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.shyrx = import ./home;
          extraSpecialArgs = { inherit inputs; };
        };
      };

      nixosConfigurations = {
        nixos-lp-omen = inputs.nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            inputs.home-manager.nixosModule

            ./hosts/nixos-lp-omen

            { nixpkgs.overlays = attrValues overlays; }
          ] ++ attrValues nixosModules;

          specialArgs = { inherit inputs; };
        };
      };
    };
}
