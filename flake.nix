{
  description = "nixos configuration";

  nixConfig = {
    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    warn-dirty = false;
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs.nixpkgs = {
    url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  inputs.flake-parts = {
    url = "github:hercules-ci/flake-parts";
    inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  inputs.import-tree = {
    url = "github:denful/import-tree";
  };

  inputs.helium = {
    url = "github:amaanq/helium-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}

