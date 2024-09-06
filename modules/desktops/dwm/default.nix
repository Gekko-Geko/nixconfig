{ lib, ... }

{
  xserver.enable = true;
  xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.dwm = {
    enable = true;
    package = pkgs.dwm.overrideAttrs rec {
      pname = "dwm";
      version = "6.5";
      src = pkgs.fetchFromGithub {
      	owner = "Gekko-Geko";
      	repo = "dwm";
      	rev = "760824bedef2237f8eb45fcf554a3da4375b5c7e";
      	hash = "";
      };
    };
  };
}
