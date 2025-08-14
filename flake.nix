{
  description = "Pedro0210 NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs =
    { ... }@inputs:
    let

      mkSystem =
        pkgs: system: hostname:
        pkgs.lib.nixosSystem {
          system = system;
          modules = [
            { networking.hostName = hostname; }
            # General configuration (users, networking, sound, etc)
            ./modules/configuration.nix

            (./. + "/hosts/${hostname}/hardware-configuration.nix")
          ];
        };

    in
    {
      nixosConfigurations = {
        pedropc = mkSystem inputs.nixpkgs "x86_64-linux" "pedropc";
      };
    };
}
