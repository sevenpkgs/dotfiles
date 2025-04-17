{
  config,
  pkgs,
  lib,
  ...
}: {
  # fish
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      procuptime = "ps -o etime= -p";
      ls = "eza";
      l = "eza -l";
      la = "eza -la";
      tree = "eza -T";
      fdf = "cd ~/.dotfiles && ff ~/.dotfiles";
      fdfn = "ff ~/.dotfiles";
    };
  };
  home.sessionPath = [
    "/home/seven/.dotfiles/scripts/"
  ];

  # functions
  home.file.".config/fish/functions/fish_prompt.fish".source = ../configs/fish/functions/fish_prompt.fish;
  home.file.".config/fish/functions/y.fish".source = ../configs/fish/functions/y.fish;
}
