{
  config,
  pkgs,
  lib,
  ...
}: {
  # stylix

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.enable = true;
  stylix.autoEnable = true;

  stylix.targets = {
    gnome.enable = false;
    kde.enable = false;
    yazi.enable = false;
    nvf.enable = false;
  };

  # fonts
  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    sansSerif = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    emoji = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
  };

  stylix.fonts.sizes = {
    desktop = 12;
    terminal = 13;
  };

  stylix.cursor = {
    package = pkgs.capitaine-cursors-themed;
    name = "Capitaine Cursors (Gruvbox) - White";
    size = 32;
  };
}
