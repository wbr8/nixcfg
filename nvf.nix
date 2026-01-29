{
  config,
  pkgs,
  inputs,
  ...
}: let
  vague-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "vague-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "vague-theme";
      repo = "vague.nvim";
      rev = "main";
      sha256 = "sha256-+rtCstolNyC0j0oWtWvWPWZtzpX5cVNCXGBpRJ9Unsk=";
    };
  };
in {
  programs.nvf = {
    enable = true;

    settings.vim = {
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

      extraPlugins = with pkgs.vimPlugins; {
        vague-nvim = {
          package = vague-nvim;
          setup = ''
            require('vague').setup()
            vim.cmd('colorscheme vague')
          '';
        };
      };
      theme.enable = false;

      viAlias = false;
      vimAlias = false;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;

        nix.enable = true;
        markdown.enable = true;
        clang.enable = true;
        rust = {
          enable = true;
          extensions.crates-nvim.enable = true;
        };
        typst.enable = true;
        python.enable = true;
        svelte.enable = true;
        haskell.enable = true;
        html.enable = true;
        css.enable = true;
        json.enable = true;
        ts.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
        neogit.enable = true;
      };

      utility = {
        sleuth.enable = true;
      };
    };
  };
}
