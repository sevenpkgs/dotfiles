{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  imports = [
    ./programs/nvf.nix
    ./programs/stylix.nix
    ./programs/fish.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "seven";
  home.homeDirectory = "/home/seven";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nh
    microfetch
    btop
    eza
    obsidian
    feh
    #    (pkgs.callPackage ./programs/harsh.nix {})
    (pkgs.callPackage ./programs/sent.nix {})
    flameshot
    neovim
    dust
    keepassxc
    alejandra
    (ncmpcpp.override {visualizerSupport = true;})
    mpd
    bat
    librewolf
    lazygit
    (ffmpeg.override {withXcb = true;})
    brightnessctl
    libnotify
    dunst
    sxiv
    pkgs-unstable.gowall
    yazi
    jq
    neomutt
    lynx
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/mpd/mpd.conf".source = ./configs/mpd/mpd.conf;
    ".config/ncmpcpp/bindings".source = ./configs/ncmpcpp/bindings;
    ".config/ncmpcpp/config".source = ./configs/ncmpcpp/config;
    ".config/zathura/gruvbox".source = ./configs/zathura/gruvbox;
    ".config/dunst/dunstrc".source = ./configs/dunst/dunstrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/seven/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_ASKPASS = "ssh-askpass-fullscreen";
    SUDO_ASKPASS = "/run/current-system/sw/bin/ssh-askpass-fullscreen";
  };

  # mpv
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
    };
  };

  # fzf
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  # zathura
  programs.zathura = {
    package = pkgs-unstable.zathura;
    enable = true;
    extraConfig = "include gruvbox";
  };

  # kitty
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  # startup
  xsession.enable = true;
  xsession.initExtra = "/home/seven/.dotfiles/scripts/startup.sh";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
