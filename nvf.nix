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
      sha256 = "sha256-y6j5IpPCIxzsCi2TrRfqDGuL6jFcHEkIBWidY1ze50Y=";
    };
  };
in {
  programs.nvf = {
    enable = true;

    settings.vim = {
      # package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

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

      options = {
        tabstop = 4;
        shiftwidth = 4;
      }; 

      lsp = {
        enable = true;
        formatOnSave = false;
        # servers.basedpyright.setupOpts.settings.basedpyright = {
        #   typeCheckingMode = "off";
        #   diagnosticMode = "openFilesOnly";
        #   reportGeneralTypeIssues = false;
        #   reportUnknownMemberType = false;
        #   reportUnknownArgumentType = false;
        # };
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
        # python.lsp.servers = [ "python-lsp-server" ];
        svelte.enable = true;
        haskell.enable = true;
        html.enable = true;
        css.enable = true;
        json.enable = true;
        ts.enable = true;
        julia.enable = true;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
        neogit.enable = true;
      };
      
      mini = {
        surround.enable = true;
      };

      utility = {
        sleuth.enable = true;
        # surround.enable = true;  # weird default keybindings in nvf, opting to use mini.surround instead
      };

      autocomplete.nvim-cmp.enable = true;

      luaConfigRC = {
        basic = ''
          vim.opt.expandtab = true

          vim.g.mapleader = " "

          vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
          vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
          vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

          vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>")
        '';
      };
    };
  };
}
