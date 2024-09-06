{ config, lib, pkgs, user, ... }:

{ 
  imports =
    [(import ../../modules/programs/zsh.nix)] ++
    [(import ../../modules/programs/git.nix)];

  programs = {
    home-manager.enable = true;
  };
  
  home = {
    username = "${user}";
    homeDirectory = lib.mkDefault "/home/${user}";
    stateVersion = "24.05";
    file."${config.xdg.configHome}" = {
      source = ../../files/dotfiles;
      recursive = true;
    };
    # file."${config.xdg.configHome}" = {
    #   source = ../../files/nvim;
    #   recursive = true;
    # };
    sessionVariables = {
      ZDOTDIR = "$HOME/.config/zsh";
      BROWSER = "firefox";
      EDITOR = "nvim";
    };
    packages = with pkgs; [
	atac
	bat
	blueman
	bluez-tools
	btop
	cups
	discord
	dnscrypt-proxy
	docker-compose
	dos2unix
	dunst
	ffmpeg
	firefox
	fzf
	github-cli
	lazygit
	lf
	libnotify
	lsd
	maim
	gnumake
	man-db
	man-pages
	mpv
	ncdu
	neofetch
	neovim
	pcmanfm
	python3
	ripgrep
	rsync
	runelite
	sxiv
	syncthing
	tmux
	tree
	unzip
	vim
	wget
	zip
    ];
  };
}
