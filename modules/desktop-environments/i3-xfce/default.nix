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
  
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };
  services.displayManager.defaultSession = "xfce";
  services.picom.enable = true;

}
