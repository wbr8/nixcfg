{
  description = "nixos configuration";

  nixConfig = {
    extra-substituters = [
    ];

    extra-trusted-public-keys = [
    ];

    experimental-features = [
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    warn-dirty = false;
  };

  outputs =
    inputs:
    (import "${inputs.flake-parts}/lib.nix" { lib = import ./lib inputs.nixpkgs.lib; }).mkFlake
      { inherit inputs; }
      (
        { lib, ... }:
        let
          inherit (lib.filesystem) listFilesRecursive;
          inherit (lib.lists) filter;
          inherit (lib.strings) hasSuffix;
        in
        {
          systems = [
            "aarch64-darwin"
            "aarch64-linux"
            "x86_64-linux"
          ];

          imports = filter (hasSuffix ".mod.nix") (listFilesRecursive ./.);
        }
      );

  inputs.nixpkgs = {
    url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  inputs.flake-parts = {
    url = "github:hercules-ci/flake-parts";
    inputs.nixpkgs-lib.follows = "nixpkgs";
  };

  inputs.helium = {
    url = "github:amaanq/helium-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}

