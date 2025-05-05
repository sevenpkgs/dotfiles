{
  description = "nixflake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    norg-meta.url = "github:nvim-neorg/tree-sitter-norg-meta";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    norg-meta,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      dwmachine = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    homeConfigurations = {
      seven = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeManagerModules.stylix
          nvf.homeManagerModules.default
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit norg-meta;
        };
      };
    };
  };
}
