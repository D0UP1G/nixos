{ config, pkgs, ... }:

{
  # Включение Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako
      alacritty
      wofi
    ];
  };
  
  # Настройка графики
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "sway";
      gdm.enable = true;  # или lightdm/sddm
    };
  };
  
  # Установка пакетов
  environment.systemPackages = with pkgs; [
    waybar
    grim
    slurp
    brightnessctl
  ];
  
  # Разрешения для Wayland
  security.polkit.enable = true;
  
  # Для доступа к подсветке клавиатуры и т.п.
  users.users.doupig.extraGroups = [ "video" "input" ];
}
