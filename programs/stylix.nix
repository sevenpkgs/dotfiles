{
  config,
  pkgs,
  lib,
  ...
}: {
  # stylix
  stylix.base16Scheme = {
    base00 = "#282828"; # ----
    base01 = "#3c3836"; # ---
    base02 = "#504945"; # --
    base03 = "#665c54"; # -
    base04 = "#bdae93"; # +
    base05 = "#d5c4a1"; # ++
    base06 = "#ebdbb2"; # +++
    base07 = "#fbf1c7"; # ++++
    base08 = "#fb4934"; # red
    base09 = "#fe8019"; # orange
    base0A = "#fabd2f"; # yellow
    base0B = "#b8bb26"; # green
    base0C = "#8ec07c"; # aqua/cyan
    base0D = "#83a598"; # blue
    base0E = "#d3869b"; # purple
    base0F = "#d65d0e"; # brown
  };

  stylix.enable = true;
  stylix.autoEnable = true;

  stylix.targets = {
    gnome.enable = false;
    kde.enable = false;
    yazi.enable = false;
  };

  # fonts
  stylix.fonts.serif = {
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    name = "JetBrainsMonoNL NF";
  };

  stylix.fonts.sansSerif = {
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    name = "JetBrainsMonoNL NF";
  };

  stylix.fonts.monospace = {
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    name = "JetBrainsMonoNL NF";
  };

  stylix.fonts.emoji = {
    package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
    name = "JetBrainsMonoNL NF";
  };

  stylix.fonts.sizes.desktop = 12;
  stylix.fonts.sizes.terminal = 13;

  stylix.iconTheme = {
    enable = true;
    package = pkgs.gruvbox-plus-icons;
    dark = "Gruvbox-Plus-Dark";
    light = "Gruvbox-Plus-Light";
  };
  stylix.cursor = {
    package = pkgs.capitaine-cursors-themed;
    name = "Capitaine Cursors (Gruvbox) - White";
  };
}
