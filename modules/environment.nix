{
  pkgs,
  lib,
  ...
}: {
  users.users.seven = {
    isNormalUser = true;
    description = "seven";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    home-manager
    wget
    git
    dmenu
    unzip
    kitty
    nh
    alsa-utils
    file
    ripgrep
    xclip
    xidlehook
    nix-init
    nurl
  ];

  # enable fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.seven.useDefaultShell = true;

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

  stylix.image = ../.wall;
  stylix.enable = true;

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
}
