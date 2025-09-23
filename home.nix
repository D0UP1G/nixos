{
  config,
  pkgs,
  inputs,
  nixvim,
  catppuccin,
  lib,
  ...
}: {
  home = {
    username = "doupig";
    homeDirectory = "/home/doupig";
    stateVersion = "25.05";
  };
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    font-awesome
    noto-fonts-emoji
    fira-code
  ];
  
  imports = [
    ./home/git.nix
    ./home/neovim.nix
    ./home/kitty.nix
    ./home/rofi.nix
    ./home/hypr/hyprland.nix
    ./home/hypr/waybar.nix
    ./home/gtk.nix
#    ./home/qt.nix
#    inputs.zen-browser.homeModules.twilight  
    inputs.nixvim.homeManagerModules.nixvim

];
  
#  programs.zen-browser = {
#    enable = true;
#    # any other options under `programs.firefox` are also supported here.
#    # see `man home-configuration.nix`.
#  };

}
