{
  description = "nix-darwin PeDro0210 flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    glide = {
      url = "github:glide-browser/glide.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      glide,
    }:
    {
      # Build darwin flake using:
      darwinConfigurations."Pedros-MacBook-Air" = nix-darwin.lib.darwinSystem {
        modules = [

          ./modules/programs/cli.nix
          ./modules/programs/de.nix
          ./modules/programs/lsp-parsers.nix
          ./modules/programs/tool-chains.nix
          ./modules/programs/external.nix
          ./modules/programs/homebrew.nix
          ./modules/programs/services.nix
          ./modules/programs/virtualization.nix

          ./modules/utils/fonts.nix

          ./modules/general.nix
        ];

        specialArgs = {
          inherit
            self
            glide
            ;
        };
      };
    };
}
