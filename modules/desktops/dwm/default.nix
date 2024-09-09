{ lib, pkgs, ... }:

{
  services = {
  	xserver.enable = true;
  	xserver.displayManager.lightdm.enable = true;
  	xserver.windowManager.dwm = {
  	  enable = true;
  	  package = pkgs.dwm.overrideAttrs rec {
  	    pname = "dwm";
  	    src = pkgs.fetchFromGitHub {
  	    	owner = "Gekko-Geko";
  	    	repo = "dwm";
  	    	rev = "2bf4f8a985b6b8cdaa549746b694dada53aa722e";
  	    	hash = "sha256-+62UcSZ6oHJMSf/Jeob5H9TocaJR81ctKpcnQgGQWMA=";
  	    };
  	  };
  	};
  };
}
