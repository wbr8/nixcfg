{

  description = "The NixOS config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";    

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    
    catppuccin.url = "github:catppuccin/nix";

    nvf.url = "github:notashelf/nvf";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, catppuccin, nvf, neovim-nightly-overlay, ... } @ inputs: {

    nixosConfigurations.T14s = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/T14s
        ./hosts/T14s/hardware
        # ./modules/desktop-environments/hyprland
        ./modules/desktop-environments/kde

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";

          home-manager.users.wojtek = {
            imports = [
              ./home.nix
              zen-browser.homeModules.beta
              catppuccin.homeModules.catppuccin
            ];
          };

          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };

}

