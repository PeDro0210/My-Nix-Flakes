{
  description = "Pedro0210 NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    { nix-flatpak, spicetify-nix, ... }@inputs:
    let

      mkSystem =
        pkgs: system: hostname:
        let
          pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; };
        in
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            spicetify-nix.nixosModules.spicetify
            nix-flatpak.nixosModules.nix-flatpak
            { networking.hostName = hostname; }
            # General configuration (users, networking, sound, etc)
            ./modules/configuration.nix

            (./. + "/hosts/${hostname}/hardware-configuration.nix")

          ];

          specialArgs = { inherit inputs pkgs-unstable; };
        };

    in
    {
      nixosConfigurations = {
        pedropc = mkSystem inputs.nixpkgs "x86_64-linux" "pedropc";
      };
    };
}
