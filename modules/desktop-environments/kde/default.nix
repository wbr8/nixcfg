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
    ../common/fonts.nix
  ];

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  
}
