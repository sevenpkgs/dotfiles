{
  config,
  pkgs,
  lib,
  ...
}: {
  # fish
  programs.fish.enable = true;
  programs.fish = {
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
  programs.fish.shellAliases = {
    procuptime = "ps -o etime= -p";
    ls = "eza";
    l = "eza -l";
    la = "eza -la";
    tree = "eza -T";
    fdf = "cd ~/.dotfiles && du -a ~/.dotfiles/* | cut -f2- | fzf | xargs -r nvim";
    fdfn = "du -a ~/.dotfiles/* | cut -f2- | fzf | xargs -r nvim";
  };

  home.sessionPath = [
    "/home/seven/.dotfiles/scripts/"
  ];
  home.file.".config/fish/functions/fish_prompt.fish".source = ../configs/fish/functions/fish_prompt.fish;
}
