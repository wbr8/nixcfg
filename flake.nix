{

  description = "The NixOS config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";    

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, catppuccin, ... } @ inputs: {

    nixosConfigurations.T14s = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/T14s
        ./hosts/T14s/hardware
        ./modules/desktop-environments/hyprland

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.wojtek = {
            imports = [
              ./home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };

}

