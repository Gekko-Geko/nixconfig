{ config, lib, pkgs, user, ... }:

{ 
  imports =
    [(import ../../modules/programs/zsh.nix)];

  programs = {
    home-manager.enable = true;
  };
  
  home = {
    username = "${user}";
    homeDirectory = lib.mkDefault "/home/${user}";
    stateVersion = "24.05";
    file."${config.xdg.configHome}" = {
      source = ../../dotfiles;
      recursive = true;
    };
    sessionVariables = {
      ZDOTDIR = "$HOME/.config/zsh";
    };
      # EDITOR = "nvim";
      # BROWSER="firefox";
    packages = with pkgs; [
	# Terminal
	btop              # Resource Manager
	neofetch          # Minimal fetch
	lf                # File Manager
	ripgrep           # Ripgrep
	python3
	neovim
	st
	tmux
	
	# Video/Audio
	sxiv               # Image Viewer
	mpv                # Media Player
	pavucontrol        # Audio Control
	
	# Apps
	firefox           # Browser
	brave             # Browser
	thunderbird       # Mail client
	remmina           # XRDP & VNC Client
	
	# File Management
	file-roller 	  # Archive Manager
	pcmanfm           # File Manager
	rsync             # Syncer - $ rsync -r dir1/ dir2/
	zip               # Zip
	unzip             # Zip Files
	unrar             # Rar Files
	
	# General configuration
	git              # Repositories
	pciutils         # Computer Utility Info
	pipewire         # Sound
	usbutils         # USB Utility Info
	wget             # Downloader
	# zsh              # Shell
	
	# General home-manager
	dunst            # Notifications
	libnotify        # Dependency for Dunst
	vim              # Text Editor
	rofi             # Menu
	rofi-power-menu  # Power Menu
	udiskie          # Auto Mounting
	
	# Xorg configuration
	xclip            # Console Clipboard
	xorg.xkill       # Kill Applications
	xorg.xrandr      # Screen Settings
	xterm            # Terminal
	
	# Desktop
	blueman          # Bluetooth
	deluge           # Torrents
	discord          # Chat
	ffmpeg           # Video Support (dslr)
	steam            # Games
	simple-scan      # Scanning
	libreoffice      # Office Tools
    ];
  };
}
