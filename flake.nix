{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Важно: используем тот же nixpkgs
    };
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      # Если хотите стабильность, используйте ветку nixos-25.05
      # url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Ключевое: наследуем основной nixpkgs
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          
          # Подключаем home-manager как модуль NixOS
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.doupig = {
              imports = [ ./home.nix nixvim.homeModules.nixvim ];
              # Дополнительные настройки Home Manager
            };
          }
        ];
      };
      
      # УДАЛИТЕ этот блок homeConfigurations!
      # Он создаёт второй экземпляр конфигурации
    };
}
