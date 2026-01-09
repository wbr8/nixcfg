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
    libertinus
    newcomputermodern
  ];
  fonts.fontDir.enable = true;
  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMonoNL Nerd Font" ];
    serif = [ "Times New Roman" ];
    sansSerif = [ "Ubuntu Sans" ];
  };

}
