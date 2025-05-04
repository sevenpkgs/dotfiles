{
  config,
  pkgs,
  lib,
  norg-meta,
  ...
}: {
  imports = [./keymaps.nix];

  programs.nvf = {
    enable = true;
    settings = {
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

        treesitter.grammars = [norg-meta.defaultPackage.${pkgs.system}];

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
          conceallevel = 2;
        };
        useSystemClipboard = true;

        ### language support
        lsp = {
          formatOnSave = true;
        };

        notes.neorg = {
          enable = true;
          treesitter.enable = true;
          setupOpts.load = {
            "core.defaults" = {};
            "core.summary" = {};
            "core.pivot" = {};
            "core.esupports.indent" = {};
            "core.concealer" = {
              config = {
                init_open_folds = "always";
                icon_preset = "diamond";
              };
            };
            "core.presenter" = {config.zen_mode = "zen-mode";};
            "core.dirman" = {
              config = {
                workspaces.root = "~/Documents/neorg";
                default_workspace = "root";
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
