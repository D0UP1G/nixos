{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    nixvim.url = "github:nix-community/nixvim/nixos-25.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };


  outputs = inputs @ { nixpkgs, home-manager, nixvim, ... }: {
    # NIXOS SYSTEM CONFIGURATION
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix  # ваш основной конфиг NixOS
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.doupig = import ./home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

    # HOME MANAGER CONFIGURATION (standalone)
    homeConfigurations.doupig = home-manager.lib.homeManagerConfiguration {
      system = "x86_64-linux";
      modules = [ ./home.nix nixvim.homeModules.nixvim];
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
