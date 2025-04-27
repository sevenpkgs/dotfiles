{
  description = "nixflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix/release-24.11";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    nvf,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    nixosConfigurations = {
      dwmachine = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };

    homeConfigurations = {
      seven = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeManagerModules.stylix
          nvf.homeManagerModules.default
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
