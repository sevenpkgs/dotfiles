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
    df = "cd ~/.dotfiles && du -a ~/.dotfiles/* | awk '{print $2}' | fzf | xargs -r nvim";
    #notes = "~/.dotfiles/scripts/notes.sh";
    #setbg = "~/.dotfiles/scripts/setbg.sh";
  };

  home.sessionPath = [
    "/home/seven/.dotfiles/scripts/"
  ];
  home.file.".config/fish/functions/fish_prompt.fish".source = ../configs/fish/functions/fish_prompt.fish;
}
