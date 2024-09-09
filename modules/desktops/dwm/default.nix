{ lib, pkgs, ... }:

# let
#   system = "x86_64-linux";
# 
#   pkgs = import nixpkgs {
#     inherit system;
#     config.allowUnfree = true;
#   };
# 
#   lib = nixpkgs.lib;
# in
{
  services = {
  	xserver.enable = true;
  	xserver.displayManager.lightdm.enable = true;
  	xserver.windowManager.dwm = {
  	  enable = true;
  	  package = pkgs.dwm.overrideAttrs rec {
  	    pname = "dwm";
	    # src = pkgs.fetchFromGitHub {
	    #          owner = "saloniamatteo";
	    #          repo = "dwm";
	    #          rev = "bb9b61617f40c46c441953758cf99e770ad02c55";
	    #          hash = "sha256-4Yc2XHND3uiClaC9SgoukbWEV/Y2/XzSABXtuylacV0=";
	    #        };
  	    src = pkgs.fetchFromGitHub {
  	    	owner = "Gekko-Geko";
  	    	repo = "dwm";
  	    	rev = "2bf4f8a985b6b8cdaa549746b694dada53aa722e";
  	    	hash = "sha256-4tiul2Ou8EzW3D9pKVEy1xuEPc2GoP2Vno5r+9hGzqI=";
  	    };
  	  };
  	};
  };
}
