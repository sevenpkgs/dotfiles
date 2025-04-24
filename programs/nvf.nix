{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };

        statusline.lualine.enable = true;

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

        options = {
          shada = "";
          shiftwidth = 2;
          linebreak = true;
        };
        useSystemClipboard = true;
        telescope.enable = true;

        lsp = {
          formatOnSave = true;
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
