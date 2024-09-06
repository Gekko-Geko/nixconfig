{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
  };
}
