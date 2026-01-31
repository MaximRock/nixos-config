{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yandex-browser = {
      url = "github:miuirussia/yandex-browser.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nvf,
      yandex-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nvfConfig = import ./programs/nvf-config { inherit pkgs; };
    in

    {
      nixosConfigurations = {
        "nixos-max" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                nvf.homeManagerModules.default
              ];
              home-manager.users.max = import ./home.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                yandexBrowserPackages = yandex-browser.packages.x86_64-linux;
                # Передаем unstable в home-manager
                unstable = import nixpkgs-unstable {
                  system = "x86_64-linux";
                  config.allowUnfree = true;
                };
              };
            }
          ];
          specialArgs = {
            inherit inputs;
            nvfConfig = nvfConfig;
            # Передаем unstable в system configuration
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
        };
      };

      homeConfigurations = {
        "max" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home.nix
            nvf.homeManagerModules.default
          ];
          extraSpecialArgs = {
            inherit inputs;
            nvfConfig = nvfConfig;
            yandexBrowserPackages = yandex-browser.packages.x86_64-linux;
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true;
            };
          };
        };
      };
    };
}

# {
#   description = "NixOS configuration with Home Manager";

#   inputs = {
#     # nixpkgs.url = "nixpkgs/nixos-25.11";
#     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#     # home-manager = {
#     #   url = "github:nix-community/home-manager/release-25.11";
#     #   inputs.nixpkgs.follows = "nixpkgs";
#     # };
#     home-manager = {
#       url = "github:nix-community/home-manager";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     nvf = {
#       url = "github:notashelf/nvf";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#     yandex-browser = {
#       url = "github:miuirussia/yandex-browser.nix";
#       inputs.nixpkgs.follows = "nixpkgs";
#     };
#   };

#   outputs =
#     {
#       nixpkgs,
#       home-manager,
#       nvf,
#       yandex-browser,
#       ...
#     }@inputs:
#     {
#       nixosConfigurations = {
#         "nixos-max" = nixpkgs.lib.nixosSystem {
#           system = "x86_64-linux";
#           modules = [
#             ./configuration.nix
#             home-manager.nixosModules.home-manager
#             {
#               home-manager.useGlobalPkgs = true;
#               home-manager.useUserPackages = true;
#               home-manager.sharedModules = [
#                 nvf.homeManagerModules.default
#               ];
#               home-manager.users.max = import ./home.nix;
#               home-manager.extraSpecialArgs = {
#                 inherit inputs;
#                 yandexBrowserPackages = yandex-browser.packages.x86_64-linux;
#               };
#             }
#           ];
#           specialArgs = { inherit inputs; };
#         };
#       };

#       homeConfigurations = {
#         "max" = home-manager.lib.homeManagerConfiguration {
#           pkgs = nixpkgs.legacyPackages.x86_64-linux;
#           modules = [
#             ./home.nix
#             nvf.homeManagerModules.default
#           ];
#           extraSpecialArgs = {
#             inherit inputs;
#             yandexBrowserPackages = yandex-browser.packages.x86_64-linux;
#           };
#         };
#       };
#     };
# }
