{
  pkgs,
  lib,
  ...
}: {
  users.users.seven = {
    isNormalUser = true;
    description = "seven";
    extraGroups = ["networkmanager" "wheel" "libvirtd"];
  };

  environment.systemPackages = with pkgs; [
    home-manager
    gnupg
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
    ssh-askpass-fullscreen
    libqalculate
  ];

  # virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # fish
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.seven.useDefaultShell = true;

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.enable = true;
  stylix.autoEnable = true;

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
