{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  imports = [
    ../common/sound.nix
  ];

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  
}
