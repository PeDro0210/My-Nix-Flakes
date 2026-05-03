{
  description = "Pedro0210 NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let

      mkSystem =
        pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            inputs.spicetify-nix.nixosModules.default
            inputs.nix-flatpak.nixosModules.nix-flatpak

            { networking.hostName = hostname; }
            # General configuration (users, networking, sound, etc)
            ./modules/configuration.nix

            (./. + "/hosts/${hostname}/hardware-configuration.nix")

          ];

          specialArgs = {
            inherit inputs system;
          };
        };

    in
    {
      nixosConfigurations = {
        pedropc = mkSystem nixpkgs "x86_64-linux" "pedropc";
      };
    };
}
