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

        lsp = {
          formatOnSave = true;
        };

        options = {
          shada = "";
          shiftwidth = 2;
        };
        useSystemClipboard = true;
        statusline.lualine.enable = true;
        telescope.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          markdown.enable = true;
          markdown.extensions.render-markdown-nvim.enable = true;

          nix.enable = true;
          nix.lsp.enable = true;

          nix.format.enable = true;
          nix.format.type = "alejandra";
        };
      };
    };
  };
}
