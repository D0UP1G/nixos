# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/dpi.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  #Driver
  hardware.graphics.enable = true;

  # Драйверы для Ice Lake
  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver    # Основной драйвер для аппаратного декодирования
    intel-vaapi-driver    # Резервный драйвер для совместимости
    intel-compute-runtime # OpenCL и oneAPI
  ];
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";  # Предпочтительный драйвер
  };

  # Параметры ядра для Ice Lake
  boot.kernelParams = [ 
    "i915.enable_guc=2"         # Включение GuC/HuC для аппаратного декодирования
    "i915.enable_fbc=1"         # Сжатие кадрового буфера
    "i915.enable_psr=1"         # Panel Self Refresh для экономии энергии
  ];

  # Прошивка
  hardware.enableRedistributableFirmware = true;

    

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.displayManager.ly.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;
  programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
  
  # Или попробуйте общие драйверы Epson
  epson-escpr2
  epson-escpr
  epsonscan2 # Может быть в drivers
 ];
  
  

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = false;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.doupig = {
    isNormalUser = true;
    description = "doupig";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    	vscodium
	obsidian
	krita
	
	telegram-desktop
    	cassette
	chromium
	gcc
	
	docker
	nodejs
	kdePackages.kdenlive
	v2raya
	obs-studio
	
	jdk8
	appimage-run
	];
  };
  
  
  services.v2raya = {
  enable = true;};

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Install firefox
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
	swaybg
	swayfx
	alacritty  
	wofi
	waybar
	networkmanager_dmenu
	pavucontrol
	python3
	go	
	git
	epsonscan2
	cups
	sane-backends
];
fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-color-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  nerd-fonts._0xproto
  nerd-fonts.droid-sans-mono
  gnome-themes-extra
  adwaita-icon-theme
  adwaita-qt
  dconf  #
];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig.enable = true;

  programs.dconf.enable = true;
  
  # Темная тема для GTK
  
  environment.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    QT_QPA_PLATFORMTHEME = "gnome";
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

    #Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

