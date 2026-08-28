{ pkgs, ... }:

# this nix file is just made for large cli commands
let

  rebuildNixOS = pkgs.writeScriptBin "rebuild-nixos" ''
    nh os switch ~/Nix-Config#pedropc --impure
  '';

  nixOsConfig = pkgs.writeScriptBin "nixos-config" ''
    nvim /home/$(whoami)/Nix-Config
  '';

  updateNixOS = pkgs.writeScriptBin "update-nixos" ''
    cd /home/$(whoami)/Nix-Config
    sudo nix flake update nixpkgs nixpkgs-unstable nix-flatpak
    sudo rebuild-nixos
  '';
in
{

  environment.systemPackages = [
    rebuildNixOS
    nixOsConfig
    updateNixOS
  ];

}
