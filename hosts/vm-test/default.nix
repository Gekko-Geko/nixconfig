{ pkgs, lib, user, ... }:

{
  # Import hardware settings
  imports =
    [(import ./hardware-configuration.nix)] ++
    [(import ../../modules/desktops/dwm/default.nix)];

  # Networking settings
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking = {
    networkmanager.enable = true;
    hostName = "vm-test";
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable services
  services = {
    qemuGuest.enable = true;
    printing.enable = true;
  };

  virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "Geko";
    extraGroups = [ "wheel" "video" "audio" "networkmanager" "scanner" "kvm" "libvirtd" "docker" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  stylix.image = ./my-cool-wallpaper.png;
  stylix.base16Scheme = {
    base00= "1e1e2e"; # base
    base01= "181825"; # mantle
    base02= "313244"; # surface0
    base03= "45475a"; # surface1
    base04= "585b70"; # surface2
    base05= "cdd6f4"; # text
    base06= "f5e0dc"; # rosewater
    base07= "b4befe"; # lavender
    base08= "f38ba8"; # red
    base09= "fab387"; # peach
    base0A= "f9e2af"; # yellow
    base0B= "a6e3a1"; # green
    base0C= "94e2d5"; # teal
    base0D= "89b4fa"; # blue
    base0E= "cba6f7"; # mauve
    base0F= "f2cdcd"; # flamingo
  };
  stylix.fonts = {
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
      name = "JetBrainsMono Nerd Font Mono";
    };
    sansSerif = {
      package = pkgs.hack-font;
      name = "hackfonts Sans";
    };
    serif = {
      package = pkgs.hack-font;
      name = "hackfont Serif";
    };
  };

}
