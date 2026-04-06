{
  description = "Pedro0210 NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
    awww.url = "git+https://codeberg.org/LGFae/awww";
  };

  outputs =
    {
      spicetify-nix,
      nix-flatpak,
      hytale-launcher,
      awww,
      nixpkgs,
      ...
    }:
    let

      mkSystem =
        pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            spicetify-nix.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak

            { networking.hostName = hostname; }
            # General configuration (users, networking, sound, etc)
            ./modules/configuration.nix

            (./. + "/hosts/${hostname}/hardware-configuration.nix")

          ];

          specialArgs = {
            inherit
              nixpkgs
              spicetify-nix
              hytale-launcher
              system
              awww
              ;
          };
        };

    in
    {
      nixosConfigurations = {
        pedropc = mkSystem nixpkgs "x86_64-linux" "pedropc";
      };
    };
}
