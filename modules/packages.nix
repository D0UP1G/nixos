{pkgs, ...}: {
  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Super important
    home-manager

    # Graphical apps
    chromium
    librewolf
    telegram-desktop
    obsidian
    bruno
    vscodium
    steam
    steam-unwrapped 
    steam-run 
    nemo
    opentabletdriver    
    # CLI apps
    btop
    git
    wget
    glib    

    # Hyprland
    appimage-run
    wofi
    waybar
    swaynotificationcenter
    libnotify
    kitty
    wl-clipboard
    hyprlock
    hyprshot
    pavucontrol
    networkmanagerapplet
    playerctl
    brightnessctl
    hyprpaper
    # Themes
    zsh-syntax-highlighting
    bibata-cursors
    candy-icons
    gnome-themes-extra    
    gsettings-desktop-schemas
        
    ## Catppuccin
    catppuccin-gtk
    catppuccin-grub
    catppuccin-papirus-folders
    catppuccin
    # Rofi
    rofi-calc
    rofi-emoji

    # Programming languages
    go
    python314
    
    # DevOps
    docker
    docker-compose

    # Education
    element
    
    # DPI bypass software
    zapret
    
    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    dejavu_fonts
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono


    # **Custom scripts**
    # (import ../scripts/wallpapers.nix { inherit pkgs; })
  ];
}
