{ pkgs, ... }:

# this nix file is just made for large cli commands
let

  rebuildNixOS = pkgs.writeScriptBin "rebuild-nixos" ''
    cd /home/$(whoami)/Nix-Config
    git add .
    nixos-rebuild switch --flake .#pedropc --impure --upgrade
    cd - 
  '';

  nixOsConfig = pkgs.writeScriptBin "nixos-config" ''
    cd /home/$(whoami)/Nix-Config
    nvim
  '';

  updateNixOS = pkgs.writeScriptBin "update-nixos" ''
    nix flake update nixpkgs nixpkgs-unstable nix-flatpak
    rebuild-nixos
  '';
in
{

  environment.systemPackages = [
    rebuildNixOS
    nixOsConfig
    updateNixOS
  ];

}
