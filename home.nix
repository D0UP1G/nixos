{
  home = {
    username = "doupig";
    homeDirectory = "/home/doupig";
    stateVersion = "25.05";
  };

  imports = [
    ./home/allacritty.nix
    ./home/waybar.nix
    ./home/wofi.nix
  ];
}
