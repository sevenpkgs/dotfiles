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

        keymaps = [
          {
            key = "jk";
            mode = ["i"];
            action = "<ESC>";
            desc = "exit insert mode";
          }
        ];

        options = {
          shada = "";
          shiftwidth = 2;
          linebreak = true;
        };
        useSystemClipboard = true;
        statusline.lualine.enable = true;
        telescope.enable = true;

        lsp = {
          formatOnSave = true;
        };

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          markdown = {
            enable = true;
            extensions.render-markdown-nvim.enable = true;
            format.enable = true;
            format.type = "denofmt";
            lsp.enable = true;
          };

          nix = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            format.type = "alejandra";
          };
        };
      };
    };
  };
}
