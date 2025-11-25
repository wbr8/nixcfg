{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{

  fonts.packages = with pkgs; [
    iosevka-bin
    nerd-fonts.jetbrains-mono
    corefonts
    vista-fonts
    ubuntu-sans
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    serif = [ "Times New Roman" ];
    sansSerif = [ "Ubuntu Sans" ];
  };

}
