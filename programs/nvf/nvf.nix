{
  config,
  pkgs,
  lib,
  pkgs-unstable,
  ...
}: {
  imports = [./keymaps.nix];

  programs.nvf = {
    enable = true;
    settings = {
      vim.package = pkgs-unstable.neovim-unwrapped;
      vim = {
        ### plugins
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        statusline.lualine.enable = true;

        binds.whichKey.enable = true;

        mini.starter = {
          enable = true;
          setupOpts = {
            header = builtins.readFile ./elias.txt;
          };
        };

        telescope = {
          enable = true;
          mappings = {
            buffers = "<leader>fb";
            findFiles = "<leader>ff";
            gitBranches = "<leader>gb";
            gitStatus = "<leader>gT";
            liveGrep = "<leader>/";
          };
        };

        git = {
          enable = true;
          gitsigns.enable = true;
          gitsigns.codeActions.enable = false;
        };

        ### keybindings
        keymaps = [
          {
            key = "jk";
            mode = ["i"];
            action = "<ESC>";
            desc = "exit insert mode";
          }
          {
            key = "__";
            mode = ["i"];
            action = "—";
            desc = "em dash";
          }
          {
            key = "<LocalLeader>tt";
            mode = ["n"];
            action = ":Neorg toggle-concealer<CR>";
            desc = "toggle Neorg concealer";
          }
        ];

        ### nvim settings
        options = {
          shada = "";
          shiftwidth = 2;
          linebreak = true;
          concealcursor = "nc";
          conceallevel = 2;
        };
        useSystemClipboard = true;

        ### language support
        lsp = {
          formatOnSave = true;
        };

        notes.neorg = {
          enable = true;
          setupOpts.load = {
            "core.defaults" = {};
            "core.concealer" = {};
            "core.summary" = {};
            "core.pivot" = {};
            "core.presenter" = {config.zen_mode = "zen-mode";};
            "core.dirman" = {
              config = {
                workspaces.main = "~/Documents/neorg";
                default_workspace = "main";
              };
            };
          };
        };

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          markdown = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            format.type = "deno_fmt";
            extensions.render-markdown-nvim.enable = true;
          };

          nix = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            format.type = "alejandra";
          };

          bash = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            format.type = "shfmt";
          };
        };
      };
    };
  };
}
