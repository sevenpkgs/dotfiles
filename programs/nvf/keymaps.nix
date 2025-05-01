{
  config,
  pkgs,
  lib,
  util,
  ...
}: let
  inherit (util) mkKeymap mkKeymapWithOpts;
  inherit (lib) optionals;
in {
  # keymaps definitely not stolen from https://github.com/Elias-Ainsworth/thornevim/

  programs.nvf.settings.vim = {
    keymaps = [
      # disable arrow keys in normal mode
      (mkKeymap "n" "<up>" "<nop>")
      (mkKeymap "n" "<down>" "<nop>")
      (mkKeymap "n" "<left>" "<nop>")
      (mkKeymap "n" "<right>" "<nop>")

      # fix page up and page down so the cursor doesn't move
      (mkKeymap "n" "<PageUp>" "<C-U>")
      (mkKeymap "n" "<PageDown>" "<C-D>")
      (mkKeymap "i" "<PageUp>" "<C-O><C-U>")
      (mkKeymap "i" "<PageDown>" "<C-O><C-D>")

      # H to go to the beginning of the line
      (mkKeymap ["n" "v" "x"] "H" "^")
      # L to go to the end of the line
      (mkKeymap ["n" "v" "x"] "L" "$")
      # Y copies to end of line
      (mkKeymap "n" "Y" "y$")

      # keep cursor in place when joining lines
      (mkKeymap "n" "J" "mzJ`z")

      # visual shifting (does not exit visual mode)
      (mkKeymap "v" "<" "<gv")
      (mkKeymap "v" ">" ">gv")

      # replace highlighted text when pasting
      (mkKeymap "v" "<C-V>" ''"+P'')

      # automatically jump to end of text pasted
      (mkKeymapWithOpts "v" "y" "y`]" {silent = true;})
      (mkKeymapWithOpts "v" "p" "p`]" {silent = true;})
      (mkKeymapWithOpts "n" "p" "p`]" {silent = true;})

      # ; is an alias for :
      (mkKeymap "n" ";" ":")

      # easier buffer navigation
      (mkKeymap "n" "<Tab>" ":bnext<CR>")
      (mkKeymap "n" "<S-Tab>" ":bprevious<CR>")

      # neorg
      (mkKeymapWithOpts "n" "<leader>ni" "<cmd>:Neorg index<CR>" {desc = "[I]ndex";})
      (mkKeymapWithOpts "n" "<leader>nj" "<cmd>:Neorg journal<CR>" {desc = "[J]ournal";})
      (mkKeymapWithOpts "n" "<leader>nr" "<cmd>:Neorg return<CR>" {desc = "[R]eturn";})
      (mkKeymapWithOpts "n" "<leader>nwd" "<cmd>:Neorg workspace<CR>" {desc = "[D]efault";})
    ];
  };
}
