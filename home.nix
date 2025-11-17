{ config, pkgs, inputs, ... }:
{
  home.username = "wojtek";
  home.homeDirectory = "/home/wojtek";

  home.packages = with pkgs; [
    fastfetch
    btop
    libreoffice-fresh
    ungoogled-chromium
  ];

  programs.zen-browser.enable = true;

  programs.helix.enable = true;
  programs.helix.settings = {
    editor = {
      true-color = true;
      line-number = "relative";
      mouse = false;
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
  };

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    terminal.shell = "${pkgs.nushell}/bin/nu";
  };

  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    border.radius = 0;
    border.width = 2;
  };

  programs.btop.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "wbr8";
      user.email = "w.bronakowski08@gmail.com";
    };
  };
     
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
  };
  gtk = {
    enable = true;
    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };
    # # iconTheme = {
    #   package = pkgs.adwaita-icon-theme;
    #   name = "Adwaita";
    # };
    # font = {
    #   name = "Sans";
    #   size = 11;
    # };
  };

  catppuccin.enable = true;
  catppuccin.flavor = "macchiato";

  home.stateVersion = "25.05";
}
