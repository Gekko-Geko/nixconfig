{ lib, ... }:

{
  services = {
    xserver.enable = true;
    xserver.displayManager.lightdm.enable = true;
    xserver.desktopManager.xfce.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };

}
