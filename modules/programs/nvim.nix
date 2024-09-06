{ pkgs, ... }:

{
  programs = {
  	# lua = { 
	#   enable = true; 
	# };
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
            # src = pkgs.fetchFromGitHub {
            #   owner = "Gekko-Geko";
            #   repo = "dwm";
            #   rev = "760824bedef2237f8eb45fcf554a3da4375b5c7e";
            #   hash = "sha256-4tiul2Ou8EzW3D9pKVEy1xuEPc2GoP2Vno5r+9hGzqI=";
            # };
          };
        };
  };
}
