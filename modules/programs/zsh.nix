{ pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      # dotDir = ".config/zsh";
      # enableCompletion = true;
      # enableAutosuggestions= true;
      # enableSyntaxHighlighting= true;
      # # autosuggestions.enable = true;
      # # syntaxHighlighting.enable = true;
      # # histSize = 100000;

      # shellAliases = {
      #   la = "ls -la";
      #   ip = "ip --color=auto";
      # };
    };
    fzf = {
      enable = true;
      # enableZshIntegration = true;
    };
  };
}
