{
  description = "My config";
  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-unstable.url = "github:nix-community/home-manager";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";
    # my-overlays.url = "path:./overlays";
    # my-overlays.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { nixpkgs
    , nixpkgs-unstable
    , nixpkgs-master
    , nixos-hardware
    , flake-utils
    , home-manager
    , home-manager-unstable
    , neovim-nightly-overlay
      # , my-overlays
    , ...
    }@inputs:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      systems = flake-utils.lib.system;
      defaultModules = [ home-manager-unstable.nixosModules.home-manager ];
    in
    rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        import ./pkgs { inherit pkgs; }
      );

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays;
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.callPackage ./shell.nix { };
      });

      legacyPackages = forAllSystems (system:
        import inputs.nixpkgs {
          inherit system;
          overlays = builtins.attrValues overlays;
          config.allowUnfree = true;
        }
      );

      legacyPackages-unstable = forAllSystems (system:
        import inputs.nixpkgs-unstable {
          inherit system;
          overlays = builtins.attrValues overlays;
          config.allowUnfree = true;
        }
      );

      nixosConfigurations = {
        nugget = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; }; # Pass flake inputs to our config
          pkgs = legacyPackages-unstable.x86_64-linux;
          system = systems.x86_64-linux;
          modules = (builtins.attrValues nixosModules) ++ defaultModules ++ [
            # > Our main nixos configuration file <
            ./nixos/nugget/configuration.nix
            # Our common nixpkgs config (unfree, overlays, etc)
            (import ./nixpkgs-config.nix { inherit overlays; })
          ];
        };
      };

      homeConfigurations = {
        "home" = home-manager.lib.homeManagerConfiguration rec {
          username = "fwrage";
          homeDirectory = "/home/${username}";
          system = systems.x86_64-linux;
          pkgs = legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
          modules = (builtins.attrValues homeManagerModules) ++ [
            # > Our main home-manager configuration file <
            ./home-manager/home/home.nix

            # Our common nixpkgs config (unfree, overlays, etc)
            (import ./nixpkgs-config.nix { inherit overlays; })
          ];
        };
      };
    };
}
