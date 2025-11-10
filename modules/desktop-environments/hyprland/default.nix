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
    ../common/greetd.nix
    ../common/fonts.nix
    ./waybar.nix
  ];  

  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    # kitty
    hyprpaper
    hyprshot
    mako
    brightnessctl
    playerctl
    bemenu
  ];

}
