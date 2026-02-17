{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.nvf.homeManagerModules.nvf
    ./nvf.nix
  ];
  
  home.username = "wojtek";
  home.homeDirectory = "/home/wojtek";

  home.packages = [
    pkgs.fastfetch
    pkgs.btop
    pkgs.libreoffice-fresh
    pkgs.ungoogled-chromium
    pkgs.sequoia-sq
    pkgs.darktable
    hashcards.package.x86_64-linux.default
  ];

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };

  programs.nushell.enable = true;
  
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      use-package
    ];
  };

  programs.vscode = {
    enable = true;
    # profiles.default.extensions = with pkgs.vscode-extensions; [
    #   catppuccin.catppuccin-vsc
    #   catppuccin.catppuccin-vsc-icons
    # ];
    profiles.default.userSettings = {
      "editor.fontFamily" = "'Iosevka Fixed Semibold', 'Droid Sans Mono', 'monospace', monospace";
    };
  };

  programs.zen-browser.enable = true;

  xdg.mimeApps = let
    value = let
      zen-browser = inputs.zen-browser.packages."x86_64-linux".beta; # or twilight
    in
      zen-browser.meta.desktopFileName;

    associations = builtins.listToAttrs (map (name: {
        inherit name value;
      }) [
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/mailto"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "application/json"
        "text/plain"
        "text/html"
      ]);
  in {
    associations.added = associations;
    defaultApplications = associations;
  };
  
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

  programs.zellij.enable = true;

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    terminal.shell = "${pkgs.nushell}/bin/nu";
    font.normal = { family = "Iosevka Fixed Semibold"; style = "Semibold"; };
    font.size = 13;
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
      core.editor = "hx";
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
  catppuccin.nvim.enable = false;
  catppuccin.flavor = "macchiato";

  home.stateVersion = "25.05";
}
