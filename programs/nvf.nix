{
  config,
  pkgs,
  lib,
  pkgs-unstable,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim.package = pkgs-unstable.neovim-unwrapped;
      vim = {
        ### theme and ui
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        statusline.lualine.enable = true;

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
        ];

        ### nvim settings
        options = {
          shada = "";
          shiftwidth = 2;
          linebreak = true;
        };
        useSystemClipboard = true;

        ### language support
        lsp = {
          formatOnSave = true;
        };
        telescope.enable = true;

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
