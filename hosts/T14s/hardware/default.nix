{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./additional-hardware.nix
    ./hardware-configuration.nix
  ];
}
