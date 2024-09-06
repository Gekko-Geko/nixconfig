{ pkgs, ... }:

{
  programs = {
        neovim = {
          enable = true;
          package = pkgs.neovim.overrideAttrs rec {
            pname = "neovim";
            src = pkgs.fetchFromGitHub {
              owner = "Gekko-Geko";
              repo = "nvim-starter";
              rev = "5d711d8ae5fc909f16fadba3341b857800b57f05";
              hash = "";
            };
          };
        };
  };
}
